class Book < ActiveRecord::Base
  attr_accessible :autor, :descripcion, :disponibilidad, :edicion, :t_prestamo, :tipo, :titulo, :user_id
end
