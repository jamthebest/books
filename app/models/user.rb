class User < ActiveRecord::Base
  attr_accessible :apellido, :password, :email, :fecha_nac, :nombre, :reputacion, :sexo, :username
end
