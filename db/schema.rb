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

ActiveRecord::Schema.define(:version => 20130501071133) do

  create_table "heart_rates", :force => true do |t|
    t.integer  "rate"
    t.float    "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "light_powers", :force => true do |t|
    t.float    "time"
    t.boolean  "on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rough_movements", :force => true do |t|
    t.float    "time"
    t.boolean  "really_rough"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
