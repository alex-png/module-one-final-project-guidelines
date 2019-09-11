class RedoDollarsColumnWithDefaultValueOf50 < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dollars, :integer, :default => 50
  end
end

