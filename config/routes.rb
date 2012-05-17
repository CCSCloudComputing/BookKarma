BookKarma::Application.routes.draw do
  resources :books

  resources :users

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
end
