Rails.application.routes.draw do

  root 'gifs#index'

  get '/gifs', to: 'gifs#index'

  get '/gifs/new', to: 'gifs#new'

  get '/gifs/:id', to: 'gifs#show'

  post '/gifs', to: 'gifs#create'

end
