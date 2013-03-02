class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :boards, dependent: :delete_all
  validates_presence_of :name

  default_scope order: 'created_at ASC'
end
