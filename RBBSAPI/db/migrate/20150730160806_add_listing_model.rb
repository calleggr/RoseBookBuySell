class AddListingModel < ActiveRecord::Migration
  def change
    create_table "listings", :force => true do |t|
      t.integer "price"
      t.integer "user_id"
      t.datetime "created_at",                       :null => false
      t.datetime "updated_at",                       :null => false
    end

    add_index "listings", ["price"], :name => "index_listings_on_price"
    add_index "listings", ["user_id"], :name => "index_listings_on_user_id"
 
  end
end
