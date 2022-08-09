Rails.application.routes.draw do
  devise_for :users

  root "articles#index"

  resources :users do
    resources :articles
  end

  resources :articles do
    resources :comments
  end

  resource :relationships, only: [:create, :destroy]
end
