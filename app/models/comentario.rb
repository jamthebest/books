class Comentario < ActiveRecord::Base
  attr_accessible :contenido, :perfil, :user
end
