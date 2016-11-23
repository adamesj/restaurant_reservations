class SearchService
  def self.search(search_term)
    if search_term
      (search_restaurants(search_term) + search_restaurants_by_category(search_term)).uniq
    else
      Restaurant.all.order("created_at DESC")
    end
  end

  def self.search_restaurants(search_term)
    Restaurant.where("name LIKE ? OR address LIKE ?", "%#{search_term}%", "%#{search_term}%" )
  end

  def self.search_restaurants_by_category(search_term)
    Category.where("name LIKE ?", "%#{search_term}%").map { |category| category.restaurants }.flatten! || []
  end
end