BookKarma::Application.routes.draw do
  resources :users

  resources :book_catalog_entries

  resources :books

  resources :requests

  resources :matches


#resources  resources :users
  resources :sessions, :only => [:new, :create, :destroy]


  match "/login" => "sessions#new", as: "login"
  match "/logout" => "sessions#destroy", as: "logout"
  match "/profile" => "application#profile", as: "profile"

  #match "/books/new" => "books#new"

  #match "/owned_books" => "owned_books#show"

  root :to => "application#home"


end
