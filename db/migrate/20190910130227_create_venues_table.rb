class CreateVenuesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :booking_id
    end

    # has_many :bookings
    # has_many :bands, through: :bookings
  end
end
