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

ActiveRecord::Schema.define(version: 20131213185727) do

  create_table "friends", force: true do |t|
    t.integer  "user_id_1"
    t.integer  "user_id_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idea_keywords", force: true do |t|
    t.integer  "idea_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.integer  "project_id"
    t.integer  "author_id"
    t.integer  "publishedDate"
    t.integer  "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_ideas", force: true do |t|
    t.integer  "idea_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "author_id"
    t.string   "name"
    t.string   "description"
    t.integer  "projectType"
    t.boolean  "isPublishedFlag"
    t.datetime "publishedDate"
    t.datetime "createdDate"
    t.datetime "lastUpdateDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nick"
    t.string   "email"
    t.string   "password"
    t.string   "company"
    t.boolean  "termflag"
    t.boolean  "confirmedAccount"
    t.datetime "termDate"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end