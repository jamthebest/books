class RemovePrestamoToReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :prestamo
      end

  def down
    add_column :reviews, :prestamo, :boolean
  end
end
