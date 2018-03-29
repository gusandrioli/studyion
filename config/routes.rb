Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }

  get 'subjects/index'
  resources :users, :subjects, :tasks, :comments

  resources :posts do
    resources :comments
  end
  
  authenticated :user do
    root 'posts#index', as: "authenticated_root"
  end

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
