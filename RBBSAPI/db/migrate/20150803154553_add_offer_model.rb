class AddOfferModel < ActiveRecord::Migration
  def change
  	create_table "offers", :force => true do |t|
      t.integer "price"
      t.integer "listing_id"
      t.integer "user_id"
      t.datetime "created_at",                       :null => false
      t.datetime "updated_at",                       :null => false
    end
  end
end
