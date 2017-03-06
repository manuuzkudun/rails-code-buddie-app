Rails.application.routes.draw do

  resources :playground_work_spaces,
    only: [:index, :create, :show, :new, :destroy],
    path: 'playgrounds'

  resources :exercise_comments, only: [:index, :create, :show]
  devise_for :users
  root to:'languages#index'
  resources :languages, only: [:index, :show]
  resources :exercises, only: [:show]
  resources :exercise_submissions, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

