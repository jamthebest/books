class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :description
      t.integer :user_id
      t.integer :book_id
      t.integer :receptor

      t.timestamps
    end
  end
end
