class Topic < ActiveRecord::Base
  attr_accessible :content, :title, :board_id

  belongs_to :user
  belongs_to :board

  has_many :comments, dependent: :destroy
  validates_presence_of :board_id, :user_id, :content, :title
end
