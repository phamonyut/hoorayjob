class RemoveProvinceFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :province
  end

  def down
    add_column :users, :province, :string
  end
end
