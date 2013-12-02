Arduino::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => "users/sessions"}
  root :to => "home#index"
  devise_scope :user do
  	resources :users, :only => [:show], :path => '' do
	  	resources :projects do
	  		member do
	  			get 'check_project_change'
	  		end
	  	end
  	end
  end
end
