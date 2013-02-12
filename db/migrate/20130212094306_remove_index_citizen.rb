class RemoveIndexCitizen < ActiveRecord::Migration
  def change
  	remove_index :users, :citizen_id
  end
end
