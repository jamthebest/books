class AddUserPresToBooks < ActiveRecord::Migration
  def change
    add_column :books, :user_pres, :integer
  end
end
