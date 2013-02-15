class AddTitleAndTelAndEmailToPost < ActiveRecord::Migration
  def change
  	add_column :employer_posts, :title, :string
  	add_column :employer_posts, :tel, :string
  	add_column :employer_posts, :email, :string

  	add_column :employee_posts, :title, :string
  	add_column :employee_posts, :tel, :string
  	add_column :employee_posts, :email, :string
  end
end
