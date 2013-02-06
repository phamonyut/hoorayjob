class EmployeePost < ActiveRecord::Base
  attr_accessible :district, :job_id, :max_salary, :min_salary, :province, :status, :user_id, :year_of_experience
  
  belongs_to :user
  belongs_to :job
end
