Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/pets', to: 'shelters_pets#index'
  get 'shelters/:id/pets/new', to: 'shelters_pets#new'
  post '/shelters', to: 'shelters#create'
  post '/pets', to: 'shelters_pets#create'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
end
