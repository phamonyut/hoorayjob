class RemoveDistrictFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :district
  end

  def down
    add_column :users, :district, :string
  end
end
