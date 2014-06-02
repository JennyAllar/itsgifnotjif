Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :gifs
  resources :gifs do
    put :favorite, on: :member
  end
  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/login' => 'sessions#new', :as => 'login'
  post '/login' => 'sessions#create'
  get '/terms' => 'terms#index', :as => 'terms'
  get '/jif' => 'jif#index', :as => 'jif'
  get '/search' => 'gifs#search', :as => 'search'
  post '/search' => 'gifs#search'
  get '/favorites' => 'gifs#favorite'

end
