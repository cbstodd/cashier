json.array!(@entrees) do |entree|
  json.extract! entree, :id, :food_item, :description, :image_url, :price
  json.url entree_url(entree, format: :json)
end
