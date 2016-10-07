Rails.application.routes.draw do

  devise_for :users, :path => 'accounts'

  resources :users do 
    resources :packages, only: [:index]
  end
  root to: "pages#index"

  resources :packages, except: [:index]

  get '/packages/subregion_options' => 'packages#subregion_options'

end
