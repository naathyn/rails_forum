class Topic < ActiveRecord::Base
  attr_accessible :content, :title, :views, :board_id

  belongs_to :user
  belongs_to :board

  has_many :comments, dependent: :destroy
  validates_presence_of :board_id, :user_id, :content, :title

  def latest_post
    comments.sort_by(&:updated_at).last || self.sort_by(&:updated_at).last
  end
end
