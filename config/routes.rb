BookKarma::Application.routes.draw do
  resources :users

  resources :books

  resources :owned_books

  resources :requests

#resources  resources :users
  resources :sessions, :only => [:new, :create, :destroy]


  match "/login" => "sessions#new", as: "login"
  match "/logout" => "sessions#destroy", as: "logout"

  #match "/books/new" => "books#new"

  #match "/owned_books" => "owned_books#show"

  root :to => "sessions#new"

end
