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

ActiveRecord::Schema.define(version: 20131218091848) do

  create_table "idea_keywords", force: true do |t|
    t.integer  "idea_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idea_points", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.boolean  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_followers", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.integer  "project_type"
    t.boolean  "is_published_flag"
    t.datetime "published_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_followers", id: false, force: true do |t|
    t.integer "following_id"
    t.integer "follower_id"
  end

  create_table "user_following", id: false, force: true do |t|
    t.integer "follower_id"
    t.integer "following_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nick"
    t.string   "email"
    t.string   "password"
    t.string   "company"
    t.boolean  "term_flag"
    t.boolean  "confirmed_account"
    t.datetime "term_date"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
