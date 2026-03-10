class Admin::ProjectsController < Admin::BaseController
  before_action :set_project, only: [ :edit, :update, :destroy ]

  def index
    @projects = Project.ordered
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_projects_path, notice: "Le projet a été créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_path, notice: "Le projet a été mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, notice: "Le projet a été supprimé."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.expect(project: [ :title, :description, :tech_stack, :repo_url, :live_url, :position, :featured, :cover_image ])
  end
end
