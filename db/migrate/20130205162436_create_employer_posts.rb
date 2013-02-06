class CreateEmployerPosts < ActiveRecord::Migration
  def change
    create_table :employer_posts do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :status
      t.integer :min_salary
      t.integer :max_salary
      t.integer :year_of_experience
      t.string :sex
      t.integer :min_age
      t.integer :max_age
      t.string :district
      t.string :province

      t.timestamps
    end
  end
end
