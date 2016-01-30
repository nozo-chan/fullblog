class User < ActiveRecord::Base
	has_many :posts 
	has_many :comments 
	
	validates :email, uniqueness: true

	scope :signed_up_recently, -> {
		where('created_at between ? and ?', Time.now- 1.day, Time.now)
	}
	scope :signed_up_today, -> { 
		where('created_at between ? and ?', Time.now.beginning_of_day, Time.now.end_of_day)
	}
	scope :order_by_email, -> {
		order mail :asc
	}

	validates_presence_of :email

	def authenticate(params_password)
		password == params_password
		
	end
end
