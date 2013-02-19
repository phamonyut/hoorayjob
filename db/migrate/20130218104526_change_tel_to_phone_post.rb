class ChangeTelToPhonePost < ActiveRecord::Migration
  def up
  	rename_column :employer_posts, :tel, :phone
  	rename_column :employee_posts, :tel, :phone
  end

  def down
  	rename_column :employer_posts, :phone, :tel
  	rename_column :employee_posts, :phone, :tel
  end
end
