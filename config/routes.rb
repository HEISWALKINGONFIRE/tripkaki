Rails.application.routes.draw do

 get '/packages/subregion_options' => 'packages#subregion_options'

  devise_scope :user do
  	post '/user/registrations/choose' => 'user/registrations#choose'
 	end
  devise_for :users, :controllers => {
  	:registrations => "user/registrations"
  }


  resources :users

  resources :packages, only: [:index]

  resources :packages, except: [:index] do
    resources :public_reservations, except: [:destroy]
  end

  root to: "pages#index"


 

end
