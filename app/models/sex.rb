class Sex < ActiveRecord::Base
  attr_accessible :name
  has_many :users
  has_many :employer_posts

  validates :name, presence: true
end
