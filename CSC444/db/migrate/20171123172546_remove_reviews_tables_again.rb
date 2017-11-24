class RemoveReviewsTablesAgain < ActiveRecord::Migration[5.1]
  def change
    drop_table :reviews_tables
  end
end
