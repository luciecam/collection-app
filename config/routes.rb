Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :seasons do
    get 'add', to: 'clothes#add', as: :add
    resources :clothes
  end

  resources :families, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :patterns, only: [:index, :new, :create, :edit, :update, :destroy]

  
  resources :factories, only: [:index, :new, :create, :edit, :update, :destroy]

end
