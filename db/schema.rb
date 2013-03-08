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

ActiveRecord::Schema.define(:version => 20130308034014) do

  create_table "alliances", :force => true do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "team3_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "auton_scores", :force => true do |t|
    t.integer  "high"
    t.integer  "medium"
    t.integer  "low"
    t.integer  "pyramid"
    t.integer  "match_id"
    t.integer  "alliance_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cards", :force => true do |t|
    t.string   "color"
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "climb_levels", :force => true do |t|
    t.integer  "height"
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "red_alliance_id"
    t.integer  "blue_alliance_id"
    t.text     "notes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "penalties", :force => true do |t|
    t.integer  "tech_foul"
    t.integer  "foul"
    t.integer  "match_id"
    t.integer  "alliance_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teleop_scores", :force => true do |t|
    t.integer  "high"
    t.integer  "medium"
    t.integer  "low"
    t.integer  "pyramid"
    t.integer  "match_id"
    t.integer  "alliance_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
