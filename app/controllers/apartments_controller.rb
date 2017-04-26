class ApartmentsController < ApplicationController
	before_filter :authorize
	def index
		@all = Apartment.all
		@apartments = Apartment.where.not(user_id: current_user.id)
		@my_apartments = Apartment.where(user_id: current_user.id)
	end


	def map
		@address = URI::escape(params[:address])
		@add_add = "&lat=#{params[:lat]}&lon=#{params[:lng]}&wsapikey=3012e929d69402d567f1e9fc53f0b457"
		url = "http://api.walkscore.com/score?format=json&address=#{@address}&#{@add_add}"
		response = HTTParty.get(url, :headers => {'Content-Type' => 'application/json'})
		@apt = Apartment.create(name: params[:title], street_add: params[:address], lat: params[:lat], lng: params[:lng], walk_score: response["walkscore"], description: response["description"], user_id: current_user.id)

		render json: "Hello"
	end


	# def apartment_map
 #    @back_url = session[:my_previous_url]
 #    @locations = Location.all
 #    @locations.each do |location|
 #    	position: location.lat && location.lng

 #    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
 #      marker.lat location.latitude
 #      marker.lng location.longitude
 #      marker.title location.title
     
 #      marker.infowindow render_to_string(:partial => "layouts/charities/popup", :locals => { :location => location})
 #    end
 #    render :template => "layouts/charities/charity_map"
 #  end


end
