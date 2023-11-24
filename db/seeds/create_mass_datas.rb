setting = Setting.first

(1.year.ago.to_date..Date.today).each do |day|
  CreateTicketAtTime.call(1, setting, day)
  CreateTicketAtTime.call(2, setting, day)
end
