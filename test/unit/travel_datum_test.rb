require 'test_helper'

class TravelDatumTest < ActiveSupport::TestCase
  ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures","trip_independent_infos")
  ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures","users")
  ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures","travel_data")
  
  tester = TravelDatum.new
  tester.date=Date.today
  tester.address="Brooklyn,NY"
  tester.school="Brooklyn Test School"
  tester.start_time=Time.now.beginning_of_day + 9.hours
  tester.gas_price=9.85
  tester.master_or_assistant="Master"
  tester.is_traveling_to_office= "Yes"
  tester.end_of_business_time=Time.now.beginning_of_day + 21.hours
  tester.process_calculated_fields
  test "distance" do
    assert_equal 63, tester.distance_from_home
   end
   test "Home to school travel time" do
     assert_equal 79, tester.home_to_school_travel_time
   end
   test "Departure" do
     assert_equal "06:01 AM", tester.departure.strftime("%I:%M %p")
   end
   test "Distance From School To office" do
     assert_equal 45, tester.distance_from_school_to_office
   end
   test "Total Trip gas cost" do
     assert_equal "50.04", tester.total_trip_gas_cost.to_s
   end
   test "Time from school to office" do
     assert_equal 62, tester.time_from_school_to_office
   end
end
