class MeetingsResult < ActiveRecord::Base
  belongs_to :user, :foreign_key=>:bdl_contact
  belongs_to :stock
  
end
