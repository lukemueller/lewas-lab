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

ActiveRecord::Schema.define(version: 20141229043113) do

  create_table "sonde_readings", force: :cascade do |t|
    t.string   "time",                          limit: 255
    t.decimal  "temperature",                               precision: 10
    t.decimal  "ph",                                        precision: 10
    t.decimal  "specific_conductivity",                     precision: 10
    t.decimal  "disolved_oxygen",                           precision: 10
    t.decimal  "turbidity",                                 precision: 10
    t.decimal  "oxidation_reduction_potential",             precision: 10
    t.decimal  "total_dissolved_solids",                    precision: 10
    t.decimal  "disolved_oxygen_saturation",                precision: 10
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

end
