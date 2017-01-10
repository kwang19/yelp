class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.string :name
      t.integer :user_id
      t.float :average_rating
      t.integer :review_count

      t.timestamps

    end
  end
end
