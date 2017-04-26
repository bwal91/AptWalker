class SessionsController < ApplicationController
  
  def create
  	user = User.find_by(email: params[:login_email])
  	if user && user.authenticate(params[:login_password])
  		session[:user_id] = user.id
  		redirect_to '/apartments'
  	else
  		flash[:error] = "Email or Password are Invalid"
  		redirect_to :back
  	end
  end


  def destroy
  	session[:user_id] = nil
  	redirect_to :root
  end

  
end