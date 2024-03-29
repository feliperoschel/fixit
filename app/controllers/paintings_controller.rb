class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag].present?
      @paintings = policy_scope(Painting.tagged_with(params[:tag]))
    else
      @paintings = policy_scope(Painting).order(created_at: :desc)
      @search = params["search"]
      if @search.present? && @search["title"] != ""
        @title = @search["title"]
        @paintings = Painting.where("title ILIKE ?", "%#{@title}%")
      end
    end
  end

  def show
    authorize @painting
    @reviews = @painting.reviews
    @related_paintings = @painting.find_related_tags
  end

  def new
    authorize @painting = Painting.new
  end

  def create
    authorize @painting = Painting.new(painting_params)
    @painting.user = current_user
    if @painting.save
      redirect_to @painting
    else
      render :new
    end
  end

  def edit
    authorize @painting
  end

  def update
    authorize @painting
    if @painting.update(painting_params)
      redirect_to @painting
    else
      render :edit
    end
  end

  def destroy
    authorize @painting
    if @painting.bookings.empty?
      @painting.destroy
      redirect_to paintings_path
    else
      render :show, notice: 'Your painting has bookings'
    end
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :description, :price, :category, :location, :photo)
  end

  def set_painting
    @painting = Painting.find(params[:id])
  end
end
