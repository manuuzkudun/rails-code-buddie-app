Rails.application.routes.draw do

  get 'exercise_submissions/create'

  devise_for :users
  root to:'languages#index'
  resources :languages, only: [:index, :show]
  resources :exercises, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
