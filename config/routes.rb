Rails.application.routes.draw do


 get '/packages/subregion_options' => 'packages#subregion_options'

  devise_scope :user do
  	post '/user/registrations/choose' => 'user/registrations#choose'
 	end
  devise_for :users, :controllers => {
  	:registrations => "user/registrations"
  }


  resources :users, only: [:show] do 
    resources :packages, only: [:index]
  end


  resources :packages, except: [:index]

  root to: "pages#index"

  resources :private_reservations
 

end
