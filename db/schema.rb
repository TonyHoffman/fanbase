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

ActiveRecord::Schema.define(:version => 20121023160645) do

  create_table "branches", :force => true do |t|
    t.integer  "contest_id"
    t.integer  "type_id"
    t.integer  "player_id"
    t.boolean  "master"
    t.integer  "stack_order"
    t.boolean  "is_player"
    t.boolean  "is_type"
    t.integer  "event_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "branch_id"
    t.integer  "prev_01"
    t.integer  "prev_02"
    t.integer  "prev_03"
    t.integer  "branch_id_five"
    t.string   "prize"
    t.string   "url_address"
    t.string   "sponsor"
  end

  create_table "branches_players", :id => false, :force => true do |t|
    t.integer "branch_id"
    t.integer "player_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "level1"
    t.string   "level2"
    t.string   "level3"
    t.string   "level4"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "contest_id"
    t.integer  "category_id"
    t.integer  "stage"
    t.boolean  "exact"
    t.integer  "upto"
    t.string   "branch"
    t.boolean  "master"
    t.boolean  "describer"
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

  create_table "events", :force => true do |t|
    t.integer  "type_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "stack_order"
  end

  create_table "players", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "first_game"
    t.integer  "last_game"
    t.string   "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "team_id"
    t.integer  "branches_count"
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

  create_table "types", :force => true do |t|
    t.integer  "sport_id"
    t.string   "event"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "stack_order"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "admin",              :default => false
  end

end
