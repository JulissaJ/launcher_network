class Post < ActiveRecord::Base
	validates :author, presence: true
	validates :body, presence: true, length: {maximum: 500} 
	validates :interest_group, presence: true

	belongs_to :interest_group
	belongs_to :author, class_name: "User" 
	has_many :comments


	# def self.number_of_posts
	# 	count = 0
	# 	all_posts = all
	# 	all_posts.each do |posts|
	# 		count += 1
	# 	end
	# 	count
	# end

	 def self.favorite
    order("comments_count DESC").limit(1).take
  end

  def self.top3
  	order("comments_count DESC").limit(3).take
  end

end
