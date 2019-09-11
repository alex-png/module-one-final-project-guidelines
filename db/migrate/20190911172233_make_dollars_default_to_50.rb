class MakeDollarsDefaultTo50 < ActiveRecord::Migration[5.0]
    def change
      remove_column :users, :dollars
    end
  end
  
