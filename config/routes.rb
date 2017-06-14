Rails.application.routes.draw do
  get '/webclient', to: 'webclient1#index'
  get '/webclient/new', to: 'webclient1#new'
  get '/webclient/:id', to: 'webclient1#show'
  post '/webclient', to: 'webclient1#create'
  patch '/webclient/:id', to: 'webclient1#update'
  get '/webclient/:id/edit', to: 'webclient1#edit'
  delete '/webclient/:id', to: 'webclient1#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
