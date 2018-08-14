Rails.application.routes.draw do
 
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  resources :nutrition_coaches
  resources :nutrition_clients
  root 'pages#index'

  get '/contact', to: 'pages#contact', as: "contact"
end
