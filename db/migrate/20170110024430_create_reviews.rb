class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.string :photos
      t.integer :customer_id
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
