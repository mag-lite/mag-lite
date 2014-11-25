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

ActiveRecord::Schema.define(:version => 20141124213938) do

  create_table "lessons", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "admin_notes"
    t.boolean  "published",     :default => false
    t.integer  "display_order", :default => 0
    t.integer  "uploader_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "lessons", ["display_order"], :name => "index_lessons_on_display_order"
  add_index "lessons", ["published", "display_order"], :name => "index_lessons_on_published_and_display_order"
  add_index "lessons", ["uploader_id"], :name => "index_lessons_on_uploader_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :limit => 100
    t.string   "password_digest", :limit => 40
    t.string   "salt",            :limit => 40
    t.string   "group_slug",      :limit => 20,  :default => "user"
    t.string   "name"
    t.string   "heard_from"
    t.integer  "target_score"
    t.integer  "actual_score"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["group_slug"], :name => "index_users_on_group_slug"

  create_table "videos", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "author_id"
    t.string   "url"
    t.integer  "length_ms",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "videos", ["lesson_id"], :name => "index_videos_on_lesson_id"

end
