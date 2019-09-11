class AddDollarsToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dollars, :integer
  end
end
