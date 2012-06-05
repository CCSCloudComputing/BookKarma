BookKarma::Application.routes.draw do
  resources :users

  resources :book_catalog_entries

  resources :books

 	resources :requests

#resources  resources :users
  resources :sessions, :only => [:new, :create, :destroy]


  match "/login" => "sessions#new", as: "login"
  match "/logout" => "sessions#destroy", as: "logout"

  #match "/books/new" => "books#new"

  #match "/owned_books" => "owned_books#show"

  root :to => "sessions#new"


end
