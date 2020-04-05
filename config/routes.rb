Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  scope '(:locale)', locale: /lo|en/ do
    root to: 'pages#home'
    get 'about', to: "pages#about"
    get 'contact', to: "pages#contact"

    resources :navbar_base_folder, only: [ :show ]
    resources :navbar_base_folder, only: [ :show ]
  end
end
