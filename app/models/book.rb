class Book < ActiveRecord::Base
  attr_accessible :autor, :descripcion, :disponibilidad, :edicion, :t_prestamo, :tipo, :titulo, :user_id, :prestamo
  validates_presence_of :autor, :t_prestamo, :tipo, :titulo

  def self.search(search)
  	if search
    	find(:all, :conditions => ['titulo LIKE ?', "%#{search}%"])
	  else
  	  find(:all)
  	end
	end

	before_validation :clean_titulo, if: "titulo.present?"

	has_many :reviews
	belongs_to :user
  private
  def clean_titulo
    self.titulo = self.titulo.strip.capitalize
  end
end
