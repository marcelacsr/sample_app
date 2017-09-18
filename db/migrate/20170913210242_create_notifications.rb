class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.integer :follower_id
      t.integer :followed_id
      t.boolean :notification_read

      t.timestamps
    end

  end
end
