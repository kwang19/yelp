class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :website
      t.string :coverphoto
      t.string :tag
      t.float :average_rating
      t.integer :review_count

      t.timestamps

    end
  end
end
