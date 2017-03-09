Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

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
  resources :exercise_submissions, only: [:create, :update]

  mount ActionCable.server, at: '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

