class AddOfferModel < ActiveRecord::Migration
  def change
  	create_table "offers", :force => true do |t|
      t.integer "price"
      t.integer "listing_id"
      t.integer "user_id"
      t.datetime "created_at",                       :null => false
      t.datetime "updated_at",                       :null => false
    end

    add_index "offers", ["listing_id"], :name => "index_offers_on_listing_id"
    add_index "offers", ["user_id"], :name => "index_offers_on_user_id"
  end
end
