class ProjectsController < ApplicationController
  require "debugger"
  def index
    @user = User.find_by(slug: params[:user_id])
    @user_projects = @user.projects
    @new_project = current_user.projects.build
  end

  def show
  end

  def edit
    @project = Project.find_by(slug: params[:id])
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to user_project_path(@project.user_id, @project)
  	else
  		render 'new'
  	end
  end

  def update
  end

  private
  def project_params
    params.require(:project).permit(:name, :x_name, :y_name, :description, :user_id)
  end
end
