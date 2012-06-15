class Comentario < ActiveRecord::Base
  attr_accessible :contenido, :perfil, :user

  validates_presence_of :contenido, :perfil, :user

  belongs_to :user
	
  attr_accessible :contenido, :perfil, :user_id

  validates_presence_of :contenido

  belongs_to :user
end
