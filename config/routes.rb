LostPencil::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :postings
  resources :messages

  get "sessions/new"
  get "messages/new"
  get "postings/new"
  get "postings/all"

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/post', :to => 'postings#new'

  root :to => 'postings#all'

end
