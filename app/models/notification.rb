class Notification < ActiveRecord::Base
  attr_accessible :book_id, :description, :receptor, :user_id, :tipo, :leido
  belongs_to :user
end
