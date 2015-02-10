Rails.application.routes.draw do

  resources :bookmarks
  resources :topics

  devise_for :users
    resources :users, only: [:update, :show, :index, :edit]

  root 'welcome#index'

  get 'about' => 'welcome#about'

    resources :topics
    resources :bookmarks

end