class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = policy_scope(Painting).order(created_at: :desc)
  end

  def show
    authorize @painting
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to @painting
    else
      render :new
    end
  end

  def edit; end

  def update
    if @painting.update(painting_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @painting.destroy!
  end

  private

  def painting_params
    params.require(:painting).permit(:date, :content, :title, :rating)
  end

  def set_painting
    @painting = Painting.find(params[:id])
  end

  def render_error
    render json: { errors: @painting.errors.full_messages }
  end
end
