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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150511044454) do

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "date"
    t.integer  "meetup_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "events", ["meetup_id"], name: "index_events_on_meetup_id", using: :btree

  create_table "meetups", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "user_id",    limit: 4
    t.text     "disc",       limit: 65535
    t.float    "lat",        limit: 24
    t.float    "long",       limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "country",    limit: 255
  end

  add_index "meetups", ["user_id"], name: "index_meetups_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "meetuppic_file_name",    limit: 255
    t.string   "meetuppic_content_type", limit: 255
    t.integer  "meetuppic_file_size",    limit: 4
    t.datetime "meetuppic_updated_at"
    t.integer  "meetup_id",              limit: 4
  end

  add_index "photos", ["meetup_id"], name: "index_photos_on_meetup_id", using: :btree

  create_table "tagmeetups", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "meetup_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tagmeetups", ["meetup_id"], name: "index_tagmeetups_on_meetup_id", using: :btree
  add_index "tagmeetups", ["tag_id"], name: "index_tagmeetups_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "userevents", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "userevents", ["event_id"], name: "index_userevents_on_event_id", using: :btree
  add_index "userevents", ["user_id"], name: "index_userevents_on_user_id", using: :btree

  create_table "usermeetups", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "meetup_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "usermeetups", ["meetup_id"], name: "index_usermeetups_on_meetup_id", using: :btree
  add_index "usermeetups", ["user_id"], name: "index_usermeetups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "password_digest",     limit: 255
    t.string   "gender",              limit: 255
    t.integer  "isadmin",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "meetups"
  add_foreign_key "meetups", "users"
  add_foreign_key "photos", "meetups"
  add_foreign_key "tagmeetups", "meetups"
  add_foreign_key "tagmeetups", "tags"
  add_foreign_key "userevents", "events"
  add_foreign_key "userevents", "users"
  add_foreign_key "usermeetups", "meetups"
  add_foreign_key "usermeetups", "users"
end
