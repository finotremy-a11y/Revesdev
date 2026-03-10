class ProjectsController < ApplicationController
  allow_unauthenticated_access

  def index
    @projects = Project.ordered
  end

  def show
    @project = Project.find(params[:id])
  end
end
