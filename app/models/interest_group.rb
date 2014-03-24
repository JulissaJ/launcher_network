class InterestGroup < ActiveRecord::Base
	validates :name, presence: true 
	
	belongs_to :creator, class_name: "User" 
	has_many :users, through: :group_memberships
	
end
