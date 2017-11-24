class ChangeEndTimeToDuration < ActiveRecord::Migration[5.1]
  def change
    rename_column :service_listings, :end_time, :duration
  end
end
