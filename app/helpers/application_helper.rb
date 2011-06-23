module ApplicationHelper
  def date_history(date)
    if date && !date.to_s.empty?
      if date<Time.now().to_date
        'overdue'
      elsif date<(Time.now()+7*24*3600).to_date
        'upcoming'
      else
        'later'
      end
    end
  end
end
