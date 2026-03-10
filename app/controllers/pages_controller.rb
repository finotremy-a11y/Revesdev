class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @featured_projects = Project.where(featured: true).order(:position).limit(2)
  end

  def about
  end

  def services
  end

  def mentions_legales
  end

  def politique_confidentialite
  end

  def cgu
  end

  def sitemap
    @projects = Project.all.order(updated_at: :desc)
    render layout: false
  end
end
