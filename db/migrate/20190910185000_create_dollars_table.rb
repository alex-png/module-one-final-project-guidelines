class CreateDollarsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :dollars do |t|
      t.integer :user_id
      t.integer :dollar_amount
    end
  end
end
