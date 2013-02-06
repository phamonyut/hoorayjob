class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username        ,null: false
      t.string :password_digest ,null: false
      t.string :user_type       ,null: false
      t.string :citizen_id
      t.string :first_name      ,null: false
      t.string :last_name
      t.string :sex
      t.date :birthday
      t.string :phone           ,null: false
      t.string :email
      t.text :address           ,null: false
      t.string :district
      t.string :province        ,null: false
      t.string :personal_info
      t.binary :profile_picture

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :citizen_id, unique: true
  end
end
