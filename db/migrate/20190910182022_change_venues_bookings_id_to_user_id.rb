class ChangeVenuesBookingsIdToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :venues, :booking_id, :user_id
  end
end
