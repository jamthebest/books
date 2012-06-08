class Comentario < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :contenido, :perfil, :user

  validates_presence_of :contenido, :perfil, :user

  belongs_to :user
	
=======
  attr_accessible :contenido, :perfil, :user_id

  validates_presence_of :contenido

  belongs_to :user
>>>>>>> 2c05d65856763c0beb1797f8206b8c873954ccdb
end
