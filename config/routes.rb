Rails.application.routes.draw do
  devise_for :users
  root "pages#index"

  resources :posts do
    resources :comments
  end

  get 'blog', to: 'blogs#index'
  get 'about', to: 'pages#about'
end
