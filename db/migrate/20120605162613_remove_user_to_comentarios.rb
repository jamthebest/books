class RemoveUserToComentarios < ActiveRecord::Migration
  def up
    remove_column :comentarios, :user
      end

  def down
    add_column :comentarios, :user, :integer
  end
end
