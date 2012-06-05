class Review < ActiveRecord::Base
  attr_accessible :book_id, :contenido, :user_id

  validates_presence_of :contenido, :book_id, :user_id

  belongs_to :book
end
