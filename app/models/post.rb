class Post < ActiveRecord::Base
	# ensures posts are at least 5 characters long
	validates :title, presence: true, length: {minimum: 5}
end
