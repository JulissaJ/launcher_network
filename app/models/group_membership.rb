class GroupMembership < ActiveRecord::Base
	validates :user, presence: true
	validates :interest_group, presence: true
	belongs_to :interest_group
	belongs_to :user
	
end
