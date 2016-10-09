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


  resources :packages, except: [:index] do
    resources :public_reservations, except: [:destroy]
  end

  get '/users_public_reservations/new' => 'users_public_reservations#new'


  resources :users_public_reservations, only: [:index, :create, :show]

  root to: "pages#index"


 

end
