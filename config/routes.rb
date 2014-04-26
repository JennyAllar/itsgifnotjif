Rails.application.routes.draw do

  root 'gifs#index'

  get '/gifs', to: 'gifs#index'

  get '/gifs/new', to: 'gifs#new'

  get '/gifs/:id', to: 'gifs#show'

  post '/gifs', to: 'gifs#create'

  get '/gifs/:id/edit', to: 'gifs#edit'

  put '/gifs/:id', to: 'gifs#update'

  delete '/gifs/:id', to: 'gifs#destroy'

end
