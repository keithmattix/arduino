class ProjectsController < ApplicationController
  def index
  	@new_project = current_user.projects.build
  end

  def show
  end

  def edit
  end
end
