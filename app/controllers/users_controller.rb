class UsersController < ApplicationController


	def index

	end

	def login
	end

	def register
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/apartments'
		else
			flash[:error] = @user.errors.full_messages
			redirect_to :back
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end	

end
