json.extract! restaurant, :id, :restaurant_code, :restaurant_name, :description, :address, :location, :phone_number, :email, :review_link, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
