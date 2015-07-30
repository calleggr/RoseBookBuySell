class AddUserModel < ActiveRecord::Migration
  def change
    create_table "users", :force => true do |t|
      t.string "username"
      t.string "encrypted_password"
      t.string "email"
      t.datetime "created_at",                       :null => false
      t.datetime "updated_at",                       :null => false
    end

    add_index "users", ["username"], :name => "index_users_on_username"
    add_index "users", ["email"], :name => "index_users_on_email"
 
  end
end
