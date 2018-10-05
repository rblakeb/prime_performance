Rails.application.routes.draw do

  resources :workouts do
    get :todays, on: :collection
  end
  
  # get 'blog/', to: 'blogs#index', as: :blogs
  # get 'blog/:id', to: 'blogs#show', as: :blog
  # post 'blog/', to: 'blogs#create'
  # get 'blog/new', to: 'blogs#new', as: :new_blog
  # get 'blog/:id/edit', to: 'blogs#edit', as: :edit_blog
  # delete 'blog/:id', to: 'blogs#delete'
  # patch 'blog/:id', to: 'blogs#update'

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
  get '/waiver', to: 'pages#waiver', as: "waiver"
  get '/schedule', to: 'pages#schedule', as: "schedule"
  # get 'nutrition_coaches/sign_in', to: 'nutrition_coaches#sign_in'
end
