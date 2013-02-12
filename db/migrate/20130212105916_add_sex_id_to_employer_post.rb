class AddSexIdToEmployerPost < ActiveRecord::Migration
  def change
  	remove_column :employer_posts, :sex
  	add_column :employer_posts, :sex_id, :integer
  end
end
