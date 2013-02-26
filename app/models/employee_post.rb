class EmployeePost < ActiveRecord::Base
  attr_accessible :user, :job, :district, :job_id, :max_salary, :min_salary, :province, :status, :user_id, :year_of_experience, :desc, :title, :phone, :email
  
  belongs_to :user
  belongs_to :job
  belongs_to :district
  belongs_to :province

  validates	:job, presence: true
  validates :job_id, presence: true

  def formatted_post
  	"#{formatted_job} #{formatted_sex} #{formatted_age} #{formatted_salary} #{formatted_experience} #{formatted_address}"
  end

  def formatted_job
  	"Apply for #{self.job.job_name}"
  end

  def formatted_sex
  	"Sex: #{self.user.try(:sex).try(:name)}"
  end

  def formatted_age
  	"Age: x years"
  end

  def formatted_salary
  	"Salary: #{self.min_salary} - #{self.max_salary} Baht"
  end

  def formatted_experience
  	"Experience: #{self.year_of_experience} years"
  end

  def formatted_address
  	"#{self.district.name} #{self.province.name}"
  end

  def postCategory
    "#{self.class.name}"
  end
  def self.selected_type( types )
    if( types and !types.blank? )
      self.connection.execute(
                        sanitize_sql([
                          "select * 
                           from employee_posts e, jobs j 
                           where e.job_id = j.id
                           and j.job_name in( " + types + ")" ]))
    else
      puts "****** NOT have types"
      self.all
    end
  end
  

  def self.other_type( exclude_types )
    if( exclude_types and !exclude_types.blank? )
      self.connection.execute(
                        sanitize_sql([
                          "select * 
                           from employee_posts e, jobs j 
                           where e.job_id = j.id
                           and j.job_name not in( " + exclude_types + ")" ]))
    else
      self.all 
    end
  end
end
