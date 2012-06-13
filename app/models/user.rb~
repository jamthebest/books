class User < ActiveRecord::Base  
  has_secure_password
    				attr_accessible :apellido, :password, :email, :fecha_nac, :nombre, :reputacion, :sexo, :username, :password_confirmation
    validates_uniqueness_of :username, :email
    validates_presence_of :apellido, :email, :fecha_nac, :nombre, :sexo, :username

<<<<<<< HEAD
		has_many :comentarios
=======
  has_many :comentarios
  has_many :notifications
>>>>>>> 2c05d65856763c0beb1797f8206b8c873954ccdb
end
