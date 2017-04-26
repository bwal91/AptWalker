Rails.application.routes.draw do
  
  get '/apartments', to: 'apartments#index'

  get '/login', to: 'users#login'

  post '/register', to: 'users#register'

  post '/loginuser', to: 'sessions#create'

  post '/map', to: 'apartments#map'

  get '/logout', to: 'sessions#destroy'

  root to: 'users#index'



end
