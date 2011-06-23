class Stock < ActiveRecord::Base
  has_many :bdl_discussions
  has_many :meetings_results
  has_many :contacts
  belongs_to :sector
  belongs_to :user
  
  
  def last_position
    return self.bdl_discussions.find(:last, :order => "discussion_date ASC").try(:position_bdl).to_s
  end
end
