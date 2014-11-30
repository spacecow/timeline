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

ActiveRecord::Schema.define(version: 20141130052038) do

  create_table "articles", force: true do |t|
    t.string  "name"
    t.integer "universe_id"
    t.string  "image"
    t.string  "type"
  end

  create_table "events", force: true do |t|
    t.string  "title"
    t.integer "universe_id"
    t.string  "image"
    t.integer "parent_event_id"
  end

  create_table "participations", force: true do |t|
    t.integer "article_id"
    t.integer "event_id"
  end

  create_table "relations", force: true do |t|
    t.integer "from_article_id", null: false
    t.integer "to_article_id",   null: false
  end

  add_index "relations", ["from_article_id"], name: "from_article_id", using: :btree
  add_index "relations", ["to_article_id"], name: "to_article_id", using: :btree

  create_table "universes", force: true do |t|
    t.string "title"
  end

end
