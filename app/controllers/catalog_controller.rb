class CatalogController < ApplicationController
  def index
  	@cars = Car.all	
  end
end
