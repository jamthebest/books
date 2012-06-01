class User < ActiveRecord::Base
  attr_accessible :apellido, :contraseña, :email, :fecha_nac, :nombre, :reputacion, :sexo, :username
end
