class SwitchLatLongToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :lat, :float
    change_column :users, :long, :float
  end
end
