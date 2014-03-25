class Comment < ActiveRecord::Base
	belongs_to :post, counter_cache: true
	belongs_to :user

	validates :user, presence: true
	validates :post, presence: true
	validates :body, presence: true
end
