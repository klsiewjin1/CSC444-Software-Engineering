# This table represents the review system in our app. It allows both clients
# and teens to review each other.
class CreateReviewsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews_tables do |t|

    		t.integer :reviewerID # the user ID of who is doing the reviewing
    		t.integer :revieweeID # the user ID of who is being reviewed
    		t.text    :review # the text review the reviewer wrote
    		t.integer :rating # should be 1 - 5


    		t.timestamps
    end
  end
end
