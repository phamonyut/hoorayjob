class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
			t.string :name
			
      t.timestamps
    end
    remove_column :users, :user_type
    add_column :users, :user_type_id, :integer
  end
end
