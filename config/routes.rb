Rails.application.routes.draw do
  root "pages#index"
  resources :posts
  post 'posts/save'
end
