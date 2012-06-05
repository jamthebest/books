class Comentario < ActiveRecord::Base
  attr_accessible :contenido, :perfil, :user

  validates_presence_of :contenido, :perfil, :user

  belongs_to :user
end
