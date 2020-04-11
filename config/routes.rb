Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  scope '(:locale)', locale: /lo|en/ do
    root to: 'pages#home'
    get 'about', to: "pages#about"
    get 'contact', to: "pages#contact"
    resources :navbar_base_folders, only: [ :show ],  path: "topic"
    resources :categories, only: [ :show ]
    resources :sub_categories, only: [ :show ]
    resources :secret_navbar_base_folders, only: [ :show ], path: "training_topic"
    resources :secret_categories, only: [ :show ], path: "training_category"
    resources :secret_sub_categories, only: [ :show ], path: "training_sub_category"
  end
end
