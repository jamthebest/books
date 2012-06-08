class User < ActiveRecord::Base  
  has_secure_password
    				attr_accessible :apellido, :password, :email, :fecha_nac, :nombre, :reputacion, :sexo, :username, :password_confirmation
    validates_uniqueness_of :username, :email
    validates_presence_of :apellido, :email, :fecha_nac, :nombre, :sexo, :username

		has_many :comentarios
end
