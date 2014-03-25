class Post < ActiveRecord::Base
	validates :author, presence: true
	validates :body, presence: true, length: {maximum: 500} 
	validates :interest_group, presence: true

	belongs_to :interest_group
	belongs_to :author, class_name: "User" 
	has_many :comments

	def number_of_posts
		count = 0
		all_posts = all
		all_posts.each do |posts|
			count += 1
		end
		count
	end
end
