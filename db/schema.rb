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

ActiveRecord::Schema.define(:version => 20120711180359) do

  create_table "categories", :force => true do |t|
    t.string   "level1"
    t.string   "level2"
    t.string   "level3"
    t.string   "level4"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contests", :force => true do |t|
    t.string   "name"
    t.integer  "first_game"
    t.integer  "last_game"
    t.datetime "start"
    t.datetime "end"
    t.integer  "team_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  create_table "players", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "first_game"
    t.integer  "last_game"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "team_id"
  end

  create_table "sports", :force => true do |t|
    t.string   "description"
    t.string   "season"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sport_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "admin"
  end

end
