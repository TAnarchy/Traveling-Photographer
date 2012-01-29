class AddDailyRateToIndependentInfo < ActiveRecord::Migration
  def change
    add_column :trip_independent_infos, :daily_rate, :decimal
  end
end
