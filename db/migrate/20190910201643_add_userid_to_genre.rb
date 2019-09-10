class AddUseridToGenre < ActiveRecord::Migration[5.0]
  def change
      add_column :genres, :user_ids, :integer
  end
end
