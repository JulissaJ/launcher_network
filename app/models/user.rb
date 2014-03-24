class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true 
	validates :exp_engineer, presence: true 
	validates :launcher, presence: true

	has_many :interest_groups
end


