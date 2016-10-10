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

	resources :packages, only: [:show] do
		resources :public_reservations, except: [:destroy]
	end

	get '/users_public_reservations/new' => 'users_public_reservations#new'
	resources :users_public_reservations, only: [:index, :create, :show]


	resources :packages, except: [:index] do
		resources :private_reservations, except: [:show, :update, :destroy]
	end
	resources :private_reservations, only: [:show, :update, :destroy]
	
	
	root to: "pages#index"
end
