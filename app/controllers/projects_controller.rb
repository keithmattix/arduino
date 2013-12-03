class ProjectsController < ApplicationController
  @@project_changed = false;

  def index
    @user = User.find_by(slug: params[:user_id])
    @user_projects = @user.projects
    @new_project = current_user.projects.build
  end

  def show
    @user = User.find_by(slug: params[:user_id])
    @project = Project.find_by(slug: params[:id])
    @data_values = @project.data_values
    gon.watch.project = Project.find_by(slug: params[:id])
    gon.data_values = @data_values
    gon.check_url = check_project_change_user_project_path(current_user, @project)
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
    params[:project][:data_values] = JSON.parse(params[:project][:data_values])
    params[:project][:data_values].each_with_index do |value, index| 
      params[:project][:data_values][index] = @project.data_values.build(params[:project][:data_values][index])
      params[:project][:data_values][index].save
    end
    if @project.update(project_params)
      @@project_changed = true
      respond_to do |format|
        format.json { render :json => @project.to_json(include: :data_values) }
      end
    else
      respond_to do |format|
        format.json {render :json => { :errors => @model.errors.full_messages }, :status => 422}
     end
    end
  end

  def check_project_change
    if @@project_changed
      puts 'project has changed'
      gon.data_values = Project.find_by(slug: params[:id]).data_values
      render :js => "$('#projectchart').empty(); chartCreate();"
      @@project_changed = false
    else
      puts 'project has not changed'
      render :js => ""
    end
  end
 

  private
  def project_params
    params.require(:project).permit(:name, :x_name, :y_name, :description, :user_id, :data_values)
  end
end
