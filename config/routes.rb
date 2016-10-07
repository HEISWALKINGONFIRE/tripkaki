Rails.application.routes.draw do

  devise_scope :user do
  	post '/user/registrations/choose' => 'user/registrations#choose'
 	end
  devise_for :users, :controllers => {
  	:registrations => "user/registrations"
  }

  resources :users, only: [:show] do 
    resources :packages, only: [:index]
  end

  root to: "pages#index"

  resources :packages, except: [:index]

  get '/packages/subregion_options' => 'packages#subregion_options'

end
