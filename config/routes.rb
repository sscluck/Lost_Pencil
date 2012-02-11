LostPencil::Application.routes.draw do
  get "users/new"

  get "postings/new"

  root :to => 'postings#all'

end
