class RemoveUserToReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :user
      end

  def down
    add_column :reviews, :user, :integer
  end
end
