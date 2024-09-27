class PagesController < ApplicationController
  def home
    if params[:query].present?
      @cars = Car.search_by_name_brand_and_category(params[:query])
    else
      @cars = Car.all
    end
  end
end
