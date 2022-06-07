Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "trainings#top"
  resources :users, only: [:show, :edit, :update]
  resources :trainings do
    resources :training_comments, only: [:create, :destroy]
  end
  resources :tests, only: [:index, :new, :create, :show, :edit, :update]
end
