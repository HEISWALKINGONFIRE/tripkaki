Rails.application.routes.draw do


 get '/packages/subregion_options' => 'packages#subregion_options'

  devise_scope :user do
  	post '/user/registrations/choose' => 'user/registrations#choose'
 	end
  devise_for :users, :controllers => {
  	:registrations => "user/registrations"
  }


  resources :users

  resources :packages

  root to: "pages#index"


 

end
