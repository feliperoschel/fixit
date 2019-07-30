class ReviewsController < ApplicationController
  before_action :set_painting, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
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
    @painting = Painting.find(params[:id])
  end
end
