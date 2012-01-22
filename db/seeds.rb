# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'active_record/fixtures'

ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures","users")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures","trip_independent_infos")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures","travel_data")
