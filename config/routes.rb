# == Route Map
#
#              Prefix Verb   URI Pattern                         Controller#Action
#                root GET    /                                   sessions#new
#               login GET    /login(.:format)                    sessions#new
#                     POST   /login(.:format)                    sessions#create
#              logout DELETE /logout(.:format)                   sessions#destroy
#               users POST   /users(.:format)                    users#create
#            new_user GET    /users/new(.:format)                users#new
#     password_resets POST   /password_resets(.:format)          password_resets#create
#  new_password_reset GET    /password_resets/new(.:format)      password_resets#new
# edit_password_reset GET    /password_resets/:id/edit(.:format) password_resets#edit
#      password_reset PATCH  /password_resets/:id(.:format)      password_resets#update
#                     PUT    /password_resets/:id(.:format)      password_resets#update

Rails.application.routes.draw do
  root to:'sessions#new'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
