Rails.application.routes.draw do

  resources :blogs, param: :slug

  get 'tags/:tag', to: 'blogs#index', as: :tag

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  # resources :nutrition_coaches
  # resources :nutrition_clients

  root 'pages#index'

  get '/contact', to: 'pages#contact', as: "contact"
  get '/coaches', to: 'pages#coaches', as: "coaches"
  get '/packages', to: 'pages#packages', as: "packages"
  get '/waiver', to: 'pages#waiver', as: "waiver"

  # get 'nutrition_coaches/sign_in', to: 'nutrition_coaches#sign_in'
end
