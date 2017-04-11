class AddUserIdAndAttractionIdToRide < ActiveRecord::Migration
  def change
    add_column :rides, :user_id, :integer
    add_column :rides, :attraction_id, :integer
  end
end
