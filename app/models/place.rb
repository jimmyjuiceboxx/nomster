class Place < ActiveRecord::Base
	belongs_to :user
	geocoded_by :full_street_address 
	after_validation :geocode  

	validates :name,  presence: true, length: {minimum: 3}
	validates :address, presence: true
	validates :description, presence: true 


	 
end
