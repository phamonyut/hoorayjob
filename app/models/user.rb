class User < ActiveRecord::Base
  attr_accessible :address, :birthday, :citizen_id, :email, :first_name, :last_name, :personal_info, :phone, :profile_picture, :sex, :user_type, :username, :password, :password_confirmation, :user_type_id, :sex_id
  has_secure_password

  belongs_to :user_type
  belongs_to :sex

  has_many :employer_posts
  has_many :employee_posts

  validates	:username, presence: true, uniqueness: { case_sensitive: false }
  validates	:password, presence: true
  validates :password_confirmation, presence: true
  validates :user_type, presence: true
 	
  VALID_DIGIT_REGEX = /\A\d+\Z/
  validates	:citizen_id, presence: true, format: { with: VALID_DIGIT_REGEX }, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, allow_blank: true

  validates :first_name, presence: true
  validates :phone, presence: true
  validates :address, presence: true

  # validates :user_type, :inclusion => { :in => %w(I C) }
  # validates :sex, :inclusion => { :in => %w(M F) }

  before_save { |user| user.email = email.downcase }

end
