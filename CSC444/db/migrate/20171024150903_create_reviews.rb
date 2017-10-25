class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.integer :reviewerID
    	t.integer :revieweeID
    	t.text :review
    	t.integer :rating
      t.timestamps
    end
  end
end
