class Update < ActiveRecord::Migration[5.0]
  def change
    add_column :venue_names, :names, :string
  end
end
