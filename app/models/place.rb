class Place < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :photos

	# For map API
	geocoded_by :address 
	after_validation :geocode  

	#Validations
	validates :name,  presence: true, length: {minimum: 3}
	validates :address, presence: true
	validates :description, presence: true 


	 
end
