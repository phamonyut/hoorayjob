class RemoveRequiredFieldsFromUser < ActiveRecord::Migration
  def up
  	change_column_null :users, :user_type_id, true
  	change_column_null :users, :phone, true
  	change_column_null :users, :address, true
  end

  def down
  	change_column_null :users, :user_type_id, false, ""
  	change_column_null :users, :phone, false, ""
  	change_column_null :users, :address, false, ""
  end
end
