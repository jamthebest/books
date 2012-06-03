class Book < ActiveRecord::Base
  attr_accessible :autor, :descripcion, :disponibilidad, :edicion, :t_prestamo, :tipo, :titulo, :user_id
  validates_presence_of :autor, :t_prestamo, :tipo, :titulo

  def self.search(search)
  	if search
    	find(:all, :conditions => ['titulo LIKE ?', "%#{search}%"])
	  else
  	  find(:all)
  	end
	end
end
