
class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
    	t.integer  "interest_group_id"
    	t.integer  "user_id"
      t.timestamps
    end
  end
end
