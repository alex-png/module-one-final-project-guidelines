class ChangeBandMembersBandidToArtistid < ActiveRecord::Migration[5.0]
  def change
    rename_column :band_members, :band_id, :artist_id
  end
end
