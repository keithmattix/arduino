class ProjectsController < ApplicationController
  require "debugger"
  def index
    @user = User.find_by(slug: params[:user_id])
    @user_projects = @user.projects
    @new_project = current_user.projects.build
  end

  def show
    @user = User.find_by(slug: params[:user_id])
    @project = Project.find_by(slug: params[:id])
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to user_project_path(@project.user, @project)
  	else
  		render 'new'
  	end
  end

  def update
    @project = Project.find_by(slug: params[:id])
    params[:project][:data] = eval(params[:project][:data])
    if @project.update(project_params)
      debugger
      respond_to do |format|
        format.json { render :json => @project.to_json }
      end
    else
      respond_to do |format|
        format.json {render :json => { :errors => @model.errors.full_messages }, :status => 422}
      end
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :x_name, :y_name, :description, :user_id, :data)
  end
end
