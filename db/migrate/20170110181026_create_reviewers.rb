class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.integer :user_id
      t.string :name
      t.integer :reviews_count
      t.float :average_rating

      t.timestamps

    end
  end
end
