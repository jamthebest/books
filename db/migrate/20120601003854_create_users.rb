class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :nombre
      t.string :apellido
      t.string :password
      t.boolean :sexo
      t.datetime :fecha_nac
      t.integer :reputacion

      t.timestamps
    end
  end
end
