Rails.application.routes.draw do
  root "articles#index"

  # to replace the previous two lines with the "resources" method
  resources :articles 
end
