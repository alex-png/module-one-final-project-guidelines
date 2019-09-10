class CreateBookingsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :artist_id
      t.integer :venue_id
      t.string :date
    end
    # belongs_to :artists
    # belongs_to :venues
  end
end
