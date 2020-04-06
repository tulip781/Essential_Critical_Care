Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  scope '(:locale)', locale: /lo|en/ do
    root to: 'pages#home'
    get 'about', to: "pages#about"
    get 'contact', to: "pages#contact"
    resources :navbar_base_folders, only: [ :show ]
    resources :categories, only: [ :show ]
    resources :sub_categories, only: [ :show ]
    resources :secret_navbar_base_folders, only: [ :show ]
    resources :secret_categories, only: [ :show ]
    resources :secret_sub_categories, only: [ :show ]
  end
end
