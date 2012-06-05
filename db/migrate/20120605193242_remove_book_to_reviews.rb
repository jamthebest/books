class RemoveBookToReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :book
      end

  def down
    add_column :reviews, :book, :integer
  end
end
