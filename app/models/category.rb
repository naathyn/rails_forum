class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :boards
  has_many :topics, through: :boards
  has_many :comments, through: :topics

  validates_presence_of :name
end
