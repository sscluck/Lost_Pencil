LostPencil::Application.routes.draw do
  resources :users

  get "users/new"
  get "postings/new"

  match '/signup', :to => 'users#new'

  root :to => 'postings#all'

end
