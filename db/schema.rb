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

ActiveRecord::Schema.define(:version => 20120221000231) do

  create_table "travel_data", :force => true do |t|
    t.date      "date"
    t.string    "address"
    t.string    "school"
    t.time      "start_time"
    t.integer   "distance_from_home"
    t.time      "departure"
    t.integer   "distance_from_school_to_office"
    t.decimal   "gas_price"
    t.decimal   "total_trip_gas_cost"
    t.time      "end_of_business_time"
    t.string    "master_or_assistant"
    t.decimal   "hourly_rate"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "home_to_school_travel_time"
    t.integer   "time_from_school_to_office"
    t.integer   "total_business_time"
    t.time      "departure_time"
    t.string    "is_traveling_to_office"
  end

  create_table "trip_independent_infos", :force => true do |t|
    t.integer   "setup_time"
    t.integer   "mpg"
    t.string    "home_address"
    t.string    "office_address"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.decimal   "daily_rate"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
