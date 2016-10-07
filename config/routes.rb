Rails.application.routes.draw do

 get '/packages/subregion_options' => 'packages#subregion_options'

  resources :users do 
    resources :packages, only: [:index]
  end

  devise_for :users

  resources :packages, except: [:index]

  root to: "pages#index"


 

end
