Rails.application.routes.draw do
  root "articles#index"

  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show" # to show the title and body

  # to replace the previous two lines with the "resources" method
  resources :articles 
end
