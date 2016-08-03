namespace :ticket do

  desc "populate ticket timing"
  task :populate => :environment do
    100000.times do |i|
      # binding.pry
      t = TicketTime.new
      d = rand_date(Date.civil(2016,1,1)).to_datetime
      t.entry = d + rand_time(9.hours, 16.hours)
      t.exit = d + rand_time(t.entry - t.entry.beginning_of_day , 17.hours).seconds
      t.save
    end
  end

  def rand_date(from, to=Date.today)
    rand(from..to)
  end

  def rand_time(from, to)
    rand(from..to)
  end  
end