# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all
User.create(:nom => "Jean Duchein", :initiales => "JD", :password => "password", :email => "bdl@capital.mg1")
User.create(:nom => "Hughes Beuzelin", :initiales => "HB", :password => "password", :email => "bdl@capital.mg2")
User.create(:nom => "Bastien Bernus", :initiales => "BB", :password => "password", :email => "bdl@capital.mg3")
User.create(:nom => "Sebastien Levavasseur", :initiales => "SL", :password => "password", :email => "bdl@capital.mg4")
User.create(:nom => "Guillaume Falguiere", :initiales => "GF", :password => "password", :email => "bdl@capital.mg5")

Sector.delete_all
Sector.create(:sector_name=>"N/A")
Sector.create(:sector_name=>"Automobiles & Parts")
Sector.create(:sector_name=>"Banks")
Sector.create(:sector_name=>"Basic Resources")
Sector.create(:sector_name=>"Chemicals")
Sector.create(:sector_name=>"Construction & Materials")
Sector.create(:sector_name=>"Financial Services")
Sector.create(:sector_name=>"Food & Beverage")
Sector.create(:sector_name=>"Health Care")
Sector.create(:sector_name=>"Industrial Goods & Services")
Sector.create(:sector_name=>"Insurance")
Sector.create(:sector_name=>"Media")
Sector.create(:sector_name=>"Oil & Gas")
Sector.create(:sector_name=>"Personal & Household Goods")
Sector.create(:sector_name=>"Real Estate")
Sector.create(:sector_name=>"Retail")
Sector.create(:sector_name=>"Technology")
Sector.create(:sector_name=>"Telecommunications")
Sector.create(:sector_name=>"Travel & Leisure")
Sector.create(:sector_name=>"Utilities")
Sector.create(:sector_name=>"N/A")
