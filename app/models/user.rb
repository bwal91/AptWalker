class User < ApplicationRecord
	has_secure_password

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	has_many :apartments

	validates :first_name, :last_name, presence: :true
	validates :email, presence: :true, uniqueness: :true
	validates :password, :password_confirmation, presence: :true, if: :password_confirmation
	
end
