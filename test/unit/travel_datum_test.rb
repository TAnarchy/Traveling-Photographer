require 'test_helper'

class TravelDatumTest < ActiveSupport::TestCase
  fixtures :all
  tr= TripIndependentInfo.new
  tr.setup_time=20
  tr.mpg=25
  tr.home_address="380 Old Country Road, East Setauket, NY"
  tr.office_address = "3500 Sunrise Highway, Great River, NY"
  tr.save
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
end
