class EmployerPost < ActiveRecord::Base
  attr_accessible :district, :job_id, :max_age, :max_salary, :min_age, :min_salary, :province, :sex_id, :status, :user_id, :year_of_experience, :desc , :title, :tel, :email

  belongs_to :user
  belongs_to :job
  belongs_to :sex

  validates	:job, presence: true
  validates :job_id, presence: true

  def formatted_post
  	"#{formatted_job} #{formatted_sex} #{formatted_age} #{formatted_salary} #{formatted_experience} #{formatted_address}"
  end

  def formatted_job
  	"Want #{self.job.job_name}"
  end

  def formatted_sex
  	"Sex: #{self.sex.name}"
  end

  def formatted_age
  	"Age: #{self.min_age} - #{self.max_age} years"
  end

  def formatted_salary
  	"Salary: #{self.min_salary} - #{self.max_salary} Baht"
  end

  def formatted_experience
  	"Experience: #{self.year_of_experience} years"
  end

  def formatted_address
  	"#{self.district} #{self.province}"
  end

  def postCategory
    "#{self.class.name}"
  end
end
