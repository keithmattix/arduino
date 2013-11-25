class ProjectsController < ApplicationController
  def index
  	@new_project = current_user.projects.build
  end

  def show
  end

  def edit
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to @project
  	else
  		render 'new'
  	end
  end

  private
  def project_params
    params.require(:project).permit(:name, :x_name, :y_name, :description)
  end
end
