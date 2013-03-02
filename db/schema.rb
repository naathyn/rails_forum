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

ActiveRecord::Schema.define(:version => 20130228024332) do

  create_table "boards", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "boards", ["category_id"], :name => "index_boards_on_category_id"
  add_index "boards", ["created_at"], :name => "index_boards_on_created_at"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["created_at"], :name => "index_categories_on_created_at"
  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["topic_id"], :name => "index_comments_on_topic_id"
  add_index "comments", ["user_id", "topic_id"], :name => "index_comments_on_user_id_and_topic_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.integer  "board_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "views",      :default => 0
  end

  add_index "topics", ["board_id"], :name => "index_topics_on_board_id"
  add_index "topics", ["user_id", "board_id"], :name => "index_topics_on_user_id_and_board_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email", "username"], :name => "index_users_on_email_and_username"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
