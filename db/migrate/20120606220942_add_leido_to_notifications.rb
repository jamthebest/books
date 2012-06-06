class AddLeidoToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :leido, :boolean
  end
end
