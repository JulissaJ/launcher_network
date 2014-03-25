class Comment < ActiveRecord::Base
	validates :user, presence: true
	validates :post, presence: true
	validates :body, presence: true

	belongs_to :post
	belongs_to :user

	

	
end
