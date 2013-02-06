class Job < ActiveRecord::Base
  attr_accessible :job_name

  has_many :employer_posts
  has_many :employee_posts

  validates :job_name, presence: true
end
