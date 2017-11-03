class AddLatLonColsToUser < ActiveRecord::Migration[5.1]
  def change
  	 add_column :users, :lat, :decimal
  	 add_column :users, :long, :decimal
  end
end
