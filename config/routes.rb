Rails.application.routes.draw do
  resources  :users, :attractions

     get '/signin', to: 'sessions#new'
     post '/signin', to: 'sessions#create'
     delete '/logout', to: 'sessions#destroy'
     root "home#index"
     post '/attractions/:id', to: 'rides#create'



end
