class Board < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :category

  has_many :topics
  has_many :comments, through: :topics

  validates_presence_of :category_id, :description, :name

  def posts
    topics.count + comments.count
  end

  def latest_post
    [topics.first, comments.first].first
  end
end
