class Board < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :category

  has_many :topics

  validates_presence_of :category_id, :description, :name

  def latest_topic
    topics.sort_by(&:updated_at).last
  end

  def latest_topic_title
    latest_topic.title
  end
end
