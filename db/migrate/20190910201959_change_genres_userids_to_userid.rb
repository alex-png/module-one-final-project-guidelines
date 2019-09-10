class ChangeGenresUseridsToUserid < ActiveRecord::Migration[5.0]
  def change
    rename_column :genres, :user_ids, :user_id

  end
end
