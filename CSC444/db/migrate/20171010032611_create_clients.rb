class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :lname
      t.string :bdate
      t.string :state
      t.string :strnum
      t.string :pcode
      t.string :city
      t.string :country
      t.string :email
      t.string :cellphone

      t.timestamps
    end
  end
end
