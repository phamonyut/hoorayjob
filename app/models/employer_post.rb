class EmployerPost < ActiveRecord::Base
  attr_accessible :district, :job_id, :max_age, :max_salary, :min_age, :min_salary, :province, :sex, :status, :user_id, :year_of_experience, :desc  
  belongs_to :user
  belongs_to :job
  belongs_to :sex

  validates	:job, presence: true
end
