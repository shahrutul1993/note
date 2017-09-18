Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

 resources :notes do
 	member do
  		put 'publish' => 'notes#publish', as: :publish
 		put 'unpublish' => 'notes#unpublish', as: :unpublish
 	end
end
  authenticated :user do
	  root "notes#index", as: "authenticated_root"
	end

	root "welcome#index"
	
end
