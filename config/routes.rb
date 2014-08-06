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
  get '/jif' => 'gifs#jif', :as => 'jif'
  get '/search' => 'gifs#search', :as => 'search'
  post '/search' => 'gifs#search'
  get '/favorites' => 'gifs#favorite'
  get '/random' => 'gifs#random'
  post '/:id/text' => 'gifs#text'
  get '/about' => 'gifs#about'


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
