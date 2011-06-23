class Sector < ActiveRecord::Base
  has_many :details
  has_many :stocks
end
