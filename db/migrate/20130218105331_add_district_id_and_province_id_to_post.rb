class AddDistrictIdAndProvinceIdToPost < ActiveRecord::Migration
  def change
  	remove_column :employer_posts, :district
  	remove_column :employer_posts, :province
  	remove_column :employee_posts, :district
  	remove_column :employee_posts, :province
  	add_column :employer_posts, :district_id, :integer
  	add_column :employer_posts, :province_id, :integer
  	add_column :employee_posts, :district_id, :integer
  	add_column :employee_posts, :province_id, :integer
  end
end
