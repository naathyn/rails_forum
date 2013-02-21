class Board < ActiveRecord::Base
  include BoardsHelper
  attr_accessible :description, :name
  belongs_to :category

  has_many :topics
  has_many :comments, through: :topics

  validates_presence_of :category_id, :description, :name
end
