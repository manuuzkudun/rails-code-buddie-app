Rails.application.routes.draw do

  resources :exercise_comments, only: [:index, :create, :show]

  get 'exercise_comments/index'

  get 'exercise_comments/create'

  devise_for :users
  root to:'languages#index'
  resources :languages, only: [:index, :show]
  resources :exercises, only: [:show]
  resources :exercise_submissions, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

