class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :reviewID
      t.boolean :isTeen
      t.boolean :anonymous
      t.string :title
      t.date :date
      t.integer :helpful
      t.integer :teenID
      t.integer :clientID
      t.text :body
      t.integer :stars

      t.timestamps
    end
  end
end
