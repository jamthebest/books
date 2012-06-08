class AddUserIdToComentarios < ActiveRecord::Migration
  def change
    add_column :comentarios, :user_id, :integer
  end
end
