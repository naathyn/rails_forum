class Topic < ActiveRecord::Base
  attr_accessible :content, :title, :views, :board_id

  belongs_to :user
  belongs_to :board

  has_many :comments, dependent: :delete_all
  validates_presence_of :board_id, :user_id, :content, :title

  default_scope order: 'updated_at DESC'

  def latest_comment
    comments.last || self
  end
end
