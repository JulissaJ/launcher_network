class AddInterestGroupIdToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :interest_group_id, :integer, null: false
  end
end
