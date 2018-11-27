class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_code
      t.string :restaurant_name
      t.text :description
      t.string :address
      t.string :location
      t.string :phone_number
      t.string :email
      t.string :review_link

      t.timestamps
    end
  end
end
