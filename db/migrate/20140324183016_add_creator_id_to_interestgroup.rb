class AddCreatorIdToInterestgroup < ActiveRecord::Migration
  def change
  	add_column :interest_groups, :creator_id, :integer, null: false
  end
end
