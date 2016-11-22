class SearchService
  def search_restaurants
    if params[:q]
      search_term = params[:q]
      @restaurants = Restaurant.where("name LIKE ?", "%#{search_term}")
    else
      @restaurants = Restaurant.all.order("created_at DESC")
    end
  end
end