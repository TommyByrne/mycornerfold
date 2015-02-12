Rails.application.routes.draw do

  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end
  resources :topics

  devise_for :users
  resources :users, only: [:update, :show, :index, :edit]

  root 'welcome#index'

  get 'about' => 'welcome#about'
end