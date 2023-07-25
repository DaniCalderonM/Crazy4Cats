Rails.application.routes.draw do
  resources :cfcposts
  devise_for :cfcusers
  resources :cfccomments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "new_cfcuser_cfcreaction", to: "cfcreactions#new_cfcuser_cfcreaction", as: "new_cfcuser_cfcreaction"
  # Defines the root path route ("/")
  # root "articles#index"
  root "cfcposts#index"
end
