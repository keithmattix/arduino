Arduino::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => "users/sessions"}
  root :to => "home#index"
  devise_scope :user do
  	resources :users, :path => '' do
	  	resources :projects
  	end
  end
end
