class AddDescToPost < ActiveRecord::Migration
  def up
  	add_column :employer_posts, :desc, :text
  	add_column :employee_posts, :desc, :text
  	change_column :employer_posts, :job_id, :integer, null: false
  	change_column :employee_posts, :job_id, :integer, null: false
  end
  def down
  	remove_column :employer_posts, :desc, :text
  	remove_column :employee_posts, :desc, :text
  	change_column :employer_posts, :job_id, :integer, null: true
  	change_column :employee_posts, :job_id, :integer, null: true
  end
end
