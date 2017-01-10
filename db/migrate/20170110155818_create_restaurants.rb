class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :description
      t.string :address
      t.string :website
      t.string :coverphoto
      t.integer :restaurants_id
      t.string :restaurant_name
      t.string :tag
      t.float :average_rating
      t.integer :review_count

      t.timestamps

    end
  end
end
