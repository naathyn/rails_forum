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
    latest_post = topics.sort_by(&:updated_at) + comments.sort_by(&:updated_at)
    latest_post.sort_by(&:updated_at).last
  end
end
