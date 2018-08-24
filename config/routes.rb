Rails.application.routes.draw do
 
  # get 'blog', to: 'blogs#index', as: 'blogs'
  # get 'blogs/new', to: 'blogs#new', as: 'new_blog'
  # get 'blogs/show/:id', to: 'blogs#show', as: 'blog'
  # get 'blogs/edit', to: 'blogs#edit', as: 'edit_blog'

  resources :blogs

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

  get 'nutrition_coaches/sign_in', to: 'nutrition_coaches#sign_in'
end
