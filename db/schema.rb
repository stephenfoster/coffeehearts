# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090604202521) do

  create_table "pictures", :force => true do |t|
    t.integer  "relationship_id"
    t.string   "image_file_name"
    t.string   "string"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.string   "integer"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "first_user_id"
    t.integer  "second_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "name"
  end

  create_table "statuses", :force => true do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",             :limit => 40
    t.string   "salt",                         :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
  end

end
