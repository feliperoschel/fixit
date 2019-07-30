class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show; end

  private

  set_paintin
end
