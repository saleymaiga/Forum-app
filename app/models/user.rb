class User < ActiveRecord::Base
	has_many :replies
	has_many :topics

	validates_confirmation_of :password
end
