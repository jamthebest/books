class AddPrestamoToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :prestamo, :boolean
  end
end
