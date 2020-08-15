# == Route Map
#
#   Prefix Verb   URI Pattern          Controller#Action
#     root GET    /                    sessions#new
#    login GET    /login(.:format)     sessions#new
#          POST   /login(.:format)     sessions#create
#   logout DELETE /logout(.:format)    sessions#destroy
#    users POST   /users(.:format)     users#create
# new_user GET    /users/new(.:format) users#new

Rails.application.routes.draw do
  root to:'sessions#new'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  resources :users, only: %i[new create]
end
