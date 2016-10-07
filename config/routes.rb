Rails.application.routes.draw do
  devise_scope :user do
  	post '/user/registrations/choose' => 'user/registrations#choose'
 	end
  devise_for :users, :controllers => {
  	:registrations => "user/registrations"
  }

  resources :users, only: [:show]
  root to: "pages#index"
end
