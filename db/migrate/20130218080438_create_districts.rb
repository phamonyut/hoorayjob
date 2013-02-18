class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
    	t.string :name, null: false
    	t.integer :province_id, null: false
      t.timestamps
    end
  end
end
