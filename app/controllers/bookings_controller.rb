class BookingsController < ApplicationController

  def index
    @booking = Booking.all

  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @user = current_user
    @booking = Booking.new
    authorize @booking
    @painting = Painting.find(params[:painting_id])
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @painting = Painting.find(params[:painting_id])
    @booking.painting = @painting
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      raise
    end
  end

  def edit
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @user = current_user
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :time)
  end

end
