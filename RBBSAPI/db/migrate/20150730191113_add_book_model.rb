class AddBookModel < ActiveRecord::Migration
  def change
    create_table "books", :force => true do |t|
      t.integer "listing_id"
      t.string "title"
      t.string "edition"
      t.string "course_number"
      t.string "department"
      t.datetime "created_at",                       :null => false
      t.datetime "updated_at",                       :null => false
    end

    add_index "books", ["listing_id"], :name => "index_books_on_listing_id"
    add_index "books", ["title"], :name => "index_books_on_title"
    add_index "books", ["course_number"], :name => "index_books_on_course_number"
    add_index "books", ["department"], :name => "index_books_on_department"
 
  end
end
