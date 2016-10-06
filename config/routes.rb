Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :users, only: [:show]
  root to: "pages#index"
end
