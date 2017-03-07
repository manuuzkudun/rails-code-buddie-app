Rails.application.routes.draw do

  get 'static_pages/home'

  resources :work_space_users,
    only: [:new, :create]

  resources :exercise_work_spaces,
    only: [:show, :create, :update]

  resources :playground_work_spaces,
    only: [:index, :create, :show, :new, :destroy],
    path: 'playgrounds'

  resources :exercise_comments, only: [:index, :create, :show]

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to:'static_pages#home'

  resources :languages, only: [:index, :show]
  resources :exercises, only: [:show]
  resources :exercise_submissions, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

