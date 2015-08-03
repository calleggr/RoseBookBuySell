# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150803154553) do

  create_table "books", :force => true do |t|
    t.integer  "listing_id"
    t.string   "title"
    t.string   "edition"
    t.string   "course_number"
    t.string   "department"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "books", ["course_number"], :name => "index_books_on_course_number"
  add_index "books", ["department"], :name => "index_books_on_department"
  add_index "books", ["listing_id"], :name => "index_books_on_listing_id"
  add_index "books", ["title"], :name => "index_books_on_title"

  create_table "listings", :force => true do |t|
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "listings", ["price"], :name => "index_listings_on_price"
  add_index "listings", ["user_id"], :name => "index_listings_on_user_id"

  create_table "offers", :force => true do |t|
    t.integer  "price"
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "offers", ["listing_id"], :name => "index_offers_on_listing_id"
  add_index "offers", ["user_id"], :name => "index_offers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["username"], :name => "index_users_on_username"

end
