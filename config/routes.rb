Rails.application.routes.draw do
  devise_for :users
  root "pages#index"
  resources :posts
  post 'posts/save'
end
