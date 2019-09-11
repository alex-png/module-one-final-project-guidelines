class ChangeVenueNameAttrNamesToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :venue_names, :names, :name
  end
end
