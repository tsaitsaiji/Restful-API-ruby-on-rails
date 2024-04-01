# config/routes.rb
Rails.application.routes.draw do
  get 'hello/index'

  get '/create', to: 'posts#create'
  get '/show/:id', to: 'posts#show'
  get '/destroy/:id', to: 'posts#destroy'
  get '/json/json', to: 'posts#index'
  get '/hello', to: 'posts#hello'
end
