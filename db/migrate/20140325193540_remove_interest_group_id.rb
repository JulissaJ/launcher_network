class RemoveInterestGroupId < ActiveRecord::Migration
  def up
  	remove_column :comments, :group_id
  end

  def down
  	add_column :comments, :group_id, :integer, null: false
  end
end
