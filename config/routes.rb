Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: "pages#about"
  get 'contact', to: "pages#contact"

  resources :navbar_base_folder, only: [ :show ]
  resources :navbar_base_folder, only: [ :show ]
end
