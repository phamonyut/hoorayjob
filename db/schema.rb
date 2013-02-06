# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130206085500) do

  create_table "employee_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "status"
    t.integer  "min_salary"
    t.integer  "max_salary"
    t.integer  "year_of_experience"
    t.string   "district"
    t.string   "province"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "employer_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "status"
    t.integer  "min_salary"
    t.integer  "max_salary"
    t.integer  "year_of_experience"
    t.string   "sex"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "district"
    t.string   "province"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "job_name",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.string   "user_type",       :null => false
    t.string   "citizen_id"
    t.string   "first_name",      :null => false
    t.string   "last_name"
    t.string   "sex"
    t.date     "birthday"
    t.string   "phone",           :null => false
    t.string   "email"
    t.text     "address",         :null => false
    t.string   "personal_info"
    t.binary   "profile_picture"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["citizen_id"], :name => "index_users_on_citizen_id", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end