class CreateTicketTimes < ActiveRecord::Migration
  def change
    create_table :ticket_times do |t|
      t.datetime :entry
      t.datetime :exit

      t.timestamps
    end
  end
end
