class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :contenido
      t.integer :user
      t.integer :perfil

      t.timestamps
    end
  end
end
