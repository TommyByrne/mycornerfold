Rails.application.routes.draw do

  get 'users/show'

  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end
  resources :topics

  devise_for :users
  resources :users, only: [:update, :show]

  post :incoming, to: 'incoming#create'

  root 'welcome#index'

  get 'about' => 'welcome#about'
end