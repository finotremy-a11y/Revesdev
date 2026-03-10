class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @featured_projects = Project.where(featured: true).order(:position).limit(2)
  end

  def about
  end

  def services
  end
end
