Rails.application.routes.draw do
  resources :nutrition_coaches
  resources :nutrition_clients
  root 'pages#index'

  get '/contact', to: 'pages#contact', as: "contact"
end
