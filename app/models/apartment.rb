class Apartment < ApplicationRecord

	validates :lat, :lng, :name, presence: :true
	
end
