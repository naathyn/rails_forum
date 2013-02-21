class Topic < ActiveRecord::Base
  include TopicsHelper
  attr_accessible :content, :title, :views, :board_id

  belongs_to :user
  belongs_to :board

  has_many :comments, dependent: :destroy
  validates_presence_of :board_id, :user_id, :content, :title

  default_scope order: 'updated_at DESC'
end
