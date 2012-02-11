LostPencil::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  get "sessions/new"

  get "users/new"
  get "postings/new"

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => 'postings#all'

end
