class Admin::ContactsController < Admin::BaseController
  before_action :set_contact, only: [ :show, :destroy ]

  def index
    @contacts = Contact.order(created_at: :desc)
  end

  def show
    unless @contact.read_status
      @contact.update(read_status: true)
    end
  end

  def destroy
    @contact.destroy
    redirect_to admin_contacts_path, notice: "Le message a été supprimé."
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
