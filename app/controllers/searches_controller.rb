class SearchesController < ApplicationController
  def create
    @restaurants = SearchService.search(params[:search])
    if @restaurants
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
