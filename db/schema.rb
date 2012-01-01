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

ActiveRecord::Schema.define(:version => 20120101222430) do

  create_table "authentications", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "constants", :force => true do |t|
    t.integer  "SetupTime"
    t.integer  "mpg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_address"
    t.string   "officeAdr"
  end

  create_table "travel_data", :force => true do |t|
    t.date     "Date"
    t.string   "Address"
    t.string   "School"
    t.time     "StartTime"
    t.integer  "DistanceFromHome"
    t.time     "Departure"
    t.integer  "DistanceFromSchoolToOffice"
    t.decimal  "gasprice"
    t.decimal  "gastotal"
    t.time     "EndOfBusiness"
    t.string   "position"
    t.decimal  "HourlyRate"
    t.string   "BusinessTime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "TravelTime"
    t.integer  "TimeFromSchoolToOffice"
    t.integer  "TotalBusinessTime"
    t.time     "departureTime"
    t.string   "isTravelingToOffice"
  end

end
