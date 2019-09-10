class CreateArtistsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
    t.string :name
    t.string :genre
    t.integer :user_id
    t.timestamps    
    # has_many :bookings
    # has_many :venues, through: :bookings
    end
  end
end
