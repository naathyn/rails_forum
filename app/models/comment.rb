class Comment < ActiveRecord::Base
  attr_accessible :content, :topic_id

  belongs_to :topic
  belongs_to :user

  validates_presence_of :user_id, :topic_id, :content
end
