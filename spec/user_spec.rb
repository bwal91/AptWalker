require_relative '../app/models/user'

RSpec.describe User do 
	before(:each) do 
		@user1 = User.new('Brandon', 'Walter', 'test@test.com', 'password')
	end

	it 'has a getter and setter for all attributes' do 
		@user1.first_name = "Scott"
		@user1.last_name = "Wright"
		@user1.email = "hello@hello.com"
		@user1.password = "anotherpassword"
		expect(@user1.first_name).to eq("Scott")
		expect(@user1.last_name).to eq("Wright")
		expect(@user1.email).to eq("hello@hello.com")
		expect(@user1.password).to eq("anotherpassword")
	end
end