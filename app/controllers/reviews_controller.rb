class ReviewsController < ApplicationController
  before_action :set_painting, only: [:new, :create]

  def new
    authorize @review = Review.new
  end

  def create
    authorize @review = Review.new(review_params)
    @review.painting = @painting
    if @review.save
      redirect_to @painting
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:date, :content, :title, :rating)
  end

  def set_painting
    @painting = Painting.find(params[:painting_id])
  end
end
