class AddTitleAndTelAndEmailToPost < ActiveRecord::Migration
  def up
  	add_column :employer_posts, :title, :string
  	add_column :employer_posts, :tel, :string
  	add_column :employer_posts, :email, :string

  	add_column :employee_posts, :title, :string
  	add_column :employee_posts, :tel, :string
  	add_column :employee_posts, :email, :string
  end

  def down
  	remove_column :employer_posts, :title
  	remove_column :employer_posts, :tel
  	remove_column :employer_posts, :email

  	remove_column :employee_posts, :title
  	remove_column :employee_posts, :tel
  	remove_column :employee_posts, :email
  end
end
