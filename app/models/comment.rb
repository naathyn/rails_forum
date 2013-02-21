class Comment < ActiveRecord::Base
  attr_accessible :content, :topic_id

  belongs_to :user
  belongs_to :topic, touch: true

  validates_presence_of :user_id, :topic_id, :content
end
