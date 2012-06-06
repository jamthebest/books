class AddTipoToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :tipo, :integer
  end
end
