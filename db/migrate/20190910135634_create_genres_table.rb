class CreateGenresTable < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :venue_id
    end
  end
end
