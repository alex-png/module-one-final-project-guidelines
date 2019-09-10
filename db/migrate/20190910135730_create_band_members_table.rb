class CreateBandMembersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :band_members do |t|
      t.string :name
      t.integer :band_id
    end
  end
end
