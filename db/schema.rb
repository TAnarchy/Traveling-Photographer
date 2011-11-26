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

ActiveRecord::Schema.define(:version => 20111126201152) do

  create_table "constants", :force => true do |t|
    t.integer  "SetupTime"
    t.integer  "mpg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_address"
  end

  create_table "travel_data", :force => true do |t|
    t.date     "Date"
    t.string   "Address"
    t.string   "School"
    t.time     "StartTime"
    t.integer  "DistanceFromHome"
    t.string   "TravelTime"
    t.time     "Departure"
    t.integer  "DistanceFromSchoolToOffice"
    t.string   "TimeFromSchoolToOffice"
    t.decimal  "gasprice"
    t.decimal  "gastotal"
    t.time     "EndOfBusiness"
    t.string   "position"
    t.string   "TotalBusinessTime"
    t.decimal  "HourlyRate"
    t.string   "BusinessTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
