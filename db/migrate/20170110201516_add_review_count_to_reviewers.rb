class AddReviewCountToReviewers < ActiveRecord::Migration[5.0]
  def change
    add_column :reviewers, :reviews_count, :integer
  end
end
