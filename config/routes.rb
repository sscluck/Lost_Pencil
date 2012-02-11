LostPencil::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :postings

  get "sessions/new"

  get "users/new"
  get "postings/new"

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/post', :to => 'postings#new'

  root :to => 'postings#all'

end
