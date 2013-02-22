class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :boards, dependent: :delete_all
  validates_presence_of :name
end
