class InterestGroup < ActiveRecord::Base
	validates :name, presence: true 
	# validates :description, allow_blank: true
	belongs_to :creator, class_name: "User" 
	# has_many: users
end
