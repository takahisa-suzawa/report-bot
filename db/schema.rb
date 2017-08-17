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

ActiveRecord::Schema.define(version: 20170817045558) do

  create_table "articles", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "opening"
    t.integer "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_articles_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.date "deliver_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "webhooks", force: :cascade do |t|
    t.string "token"
    t.string "team_id"
    t.string "team_domain"
    t.string "channel_id"
    t.string "channel_name"
    t.datetime "timestamp"
    t.string "user_id"
    t.string "user_name"
    t.string "text"
    t.string "trigger_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
