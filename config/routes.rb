Rails.application.routes.draw do

  root 'landings#index'

#  root 'employees#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
#  get ':username' => 'employees#show'


  resources :employees, except: [:destroy] do
    member do
      post 'punch_in', to: 'punches#punch_in'
      post 'punch_out', to: 'punches#punch_out'
    end
  end

  resources :users, except: [:destroy]

    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
