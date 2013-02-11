class CreateSexes < ActiveRecord::Migration
  def change
    create_table :sexes do |t|
    	t.string :name
      t.timestamps
    end
    remove_column :users, :sex
    add_column :users, :sex_id, :integer
  end
end
