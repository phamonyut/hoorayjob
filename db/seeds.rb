# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserType.destroy_all
Sex.destroy_all
Job.destroy_all

individual  = UserType.create(name: 'individual')
corporation = UserType.create(name: 'corporation')
male        = Sex.create(name: 'male')
female      = Sex.create(name: 'female')

Job.create(job_name: 'housekeeper')
Job.create(job_name: 'baby-sitter')
Job.create(job_name: 'nurse')
Job.create(job_name: 'driver')
