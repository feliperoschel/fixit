class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @no_container = true
    @no_search_bar = true
    @paintings = Painting.all.sample(3)
  end
end
