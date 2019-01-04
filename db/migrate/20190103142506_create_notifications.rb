class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :search_id
      t.integer :user_id
      t.integer :event_id
      t.datetime :read_at

      t.timestamps
    end
  end
end
