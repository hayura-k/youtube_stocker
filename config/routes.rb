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
#               posts GET    /posts(.:format)                    posts#index
#                     POST   /posts(.:format)                    posts#create
#            new_post GET    /posts/new(.:format)                posts#new
#           edit_post GET    /posts/:id/edit(.:format)           posts#edit
#                post GET    /posts/:id(.:format)                posts#show
#                     PATCH  /posts/:id(.:format)                posts#update
#                     PUT    /posts/:id(.:format)                posts#update
#                     DELETE /posts/:id(.:format)                posts#destroy
#   letter_opener_web        /letter_opener                      LetterOpenerWeb::Engine
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  root to:'sessions#new'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  resources :posts
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
