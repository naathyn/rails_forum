class Board < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :category

  has_many :topics
  has_many :comments, through: :topics

  validates_presence_of :category_id, :description, :name

  def latest_post
    comments.sort_by(&:updated_at).last || topics.sort_by(&:updated_at).last
  end
end
