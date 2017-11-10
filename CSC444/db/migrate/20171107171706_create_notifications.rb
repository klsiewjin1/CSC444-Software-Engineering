class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :actor_id
      t.integer :receiver_id
      t.datetime :read_at
      t.string :action
      t.string :notification_path_type
      t.integer :notification_path_id

      t.timestamps
    end
  end
end
