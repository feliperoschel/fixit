class BookingsController < ApplicationController

  def index
    @booking = Booking.all

  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
  end


end
