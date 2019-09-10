class CreateVenueNamesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :venue_names do |t|
      t.string :names
    end
  end
end
