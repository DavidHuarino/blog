Rails.application.routes.draw do
  resources :categories

  resources :articles do
    resources :comments, only: [:create, :update, :destroy, :show]
  end
  devise_for :users
  root 'welcome#index'
end
