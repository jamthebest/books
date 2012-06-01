class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :titulo
      t.string :autor
      t.string :tipo
      t.string :descripcion
      t.integer :edicion
      t.boolean :disponibilidad
      t.string :t_prestamo
      t.integer :user_id

      t.timestamps
    end
  end
end
