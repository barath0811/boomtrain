class TicketTime < ActiveRecord::Base
	# validates :entry, presence: true, date: { :before => :exit}
	require 'csv'
	def self.get_count time
		TicketTime.where("entry < ?", time).where("exit is null or exit > ?", time).count
	end

	def self.report date
		entries = TicketTime.where("entry > ? and entry < ?", date.to_datetime, date + 1.day).select("id, 'entry' as event_type, entry as timestamp").to_a
		exits = TicketTime.where("entry > ? and entry < ?", date.to_datetime, date + 1.day).select("id, 'exit' as event_type, exit as timestamp").to_a
		result = entries + exits
		result = result.sort_by(&:timestamp)
		CSV.generate do |csv|
      csv << ["ticket_id", "event_type", "timestamp"]
      result.each do |item|
        csv << [ item.id, item.event_type, item.timestamp ]
      end
    end
	end
end
