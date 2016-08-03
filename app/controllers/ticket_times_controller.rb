class TicketTimesController < ApplicationController
  before_action :set_ticket_time, only: [:show, :edit, :update, :destroy]

  # GET /ticket_times
  # GET /ticket_times.json
  def count
    # binding.pry
    time = Time.new *flatten_time_array(params["/"])
    time = Time.zone.local_to_utc(time)
    @count = TicketTime.get_count time
    respond_to do |format|
      format.js
    end
  end

  def show_date
  end

  def show_download
  end

  def download
    # binding.pry
    date = Date.new *flatten_date_array(params["ticket_time"])
    respond_to do |format|
      format.csv { send_data TicketTime.report(date), filename: "#{date.to_s}.csv" }
    end
  end

  private
  def flatten_time_array hash
    %w(1 2 3 4 5 6).map { |e| hash["time(#{e}i)"].to_i }
  end

  def flatten_date_array hash
    %w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
  end

end
