class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :usertype
      t.string :username
      t.string :fname
      t.string :lname
      t.string :state
      t.string :streetnum
      t.string :pcode
      t.string :city
      t.string :country
      t.string :email
      t.string :cellphone
      t.date :bdate
      t.string :password_digest

      t.timestamps
    end
  end
end
