class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :boards, dependent: :destroy
  validates_presence_of :name
end
