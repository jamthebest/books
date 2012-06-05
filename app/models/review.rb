class Review < ActiveRecord::Base
  attr_accessible :book, :contenido, :user

  validates_presence_of :contenido, :book, :user

  belongs_to :book
end
