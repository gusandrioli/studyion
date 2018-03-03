Rails.application.routes.draw do


  resources :tasks
  resources :comments
  get 'subjects/index'

  devise_for :users, :controllers => { :registrations => "user/registrations" }

  root 'welcome#index'

  resources :users, :subjects

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
