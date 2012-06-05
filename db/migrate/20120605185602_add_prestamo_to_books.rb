class AddPrestamoToBooks < ActiveRecord::Migration
  def change
    add_column :books, :prestamo, :boolean
  end
end
