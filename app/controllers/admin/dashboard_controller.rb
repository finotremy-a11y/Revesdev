class Admin::DashboardController < Admin::BaseController
  def index
    @projects_count = Project.count
    @contacts_count = Contact.count
    @recent_contacts = Contact.order(created_at: :desc).limit(5)
  end
end
