class HomeController < ApplicationController
  def index
  	if current_user
  		redirect_to user_projects_path(current_user)
  	end
  end
end
