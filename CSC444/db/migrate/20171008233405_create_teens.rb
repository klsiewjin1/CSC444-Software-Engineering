class CreateTeens < ActiveRecord::Migration[5.1]
  def change
    create_table :teens do |t|
      t.string :fname
      t.string :lname
      t.string :state
      t.string :streetnum
      t.string :pcode
      t.string :city
      t.string :country
      t.string :email
      t.string :cellphone
      t.string :bdate

      t.timestamps
    end
  end
end
