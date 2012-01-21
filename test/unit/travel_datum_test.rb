require 'test_helper'

class TravelDatumTest < ActiveSupport::TestCase
  tester = TravelDatum.new
  tester.date=Date.today
  tester.address="Brooklyn,NY"
  tester.school="Brooklyn Test School"
  tester.start_time=Time.now.beginning_of_day + 9.hours
  tester.gas_price=9.99
  tester.master_or_assistant="Master"
  tester.end_of_business_time=Time.now.beginning_of_day + 21.hours
  tester.process_calculated_fields
  test "distance" do
    assert_equal 66, tester.distance_from_home
   end
end
