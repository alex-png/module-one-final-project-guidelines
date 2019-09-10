class SwitchArtistsTableId < ActiveRecord::Migration[5.0]
  def change
    rename_column :artists, :booking_id, :user_id
  end
end
