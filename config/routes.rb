Rails.application.routes.draw do

  get 'work_spaces/index'

  get 'work_spaces/create'

  get 'work_spaces/show'

  get 'work_spaces/config_opentok'

  resources :exercise_comments, only: [:index, :create, :show]
  devise_for :users
  root to:'languages#index'
  resources :languages, only: [:index, :show]
  resources :exercises, only: [:show]
  resources :exercise_submissions, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

