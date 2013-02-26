class EmployerPost < ActiveRecord::Base
  attr_accessible :district, :job_id, :max_age, :max_salary, :min_age, :min_salary, :province, :sex_id, :status, :user_id, :year_of_experience, :desc , :title, :phone, :email

  belongs_to :user
  belongs_to :job
  belongs_to :sex
  belongs_to :district
  belongs_to :province

  validates	:job, presence: true
  validates :job_id, presence: true

  def formatted_post
  	"#{formatted_job} #{formatted_sex} #{formatted_age} #{formatted_salary} #{formatted_experience} #{formatted_address}"
  end

  def formatted_job
  	"Want #{self.job.job_name}"
  end

  def formatted_sex
  	"Sex: #{self.try(:sex).try(:name)}"
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
                           from employer_posts e, jobs j 
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
                           from employer_posts e, jobs j 
                           where e.job_id = j.id
                           and j.job_name not in( " + exclude_types + ")" ]))
    else
      self.all 
    end
  end
end
