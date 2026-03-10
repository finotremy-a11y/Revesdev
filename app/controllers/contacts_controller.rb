class ContactsController < ApplicationController
  allow_unauthenticated_access

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to confirmation_contact_path(@contact), notice: "Merci pour votre message !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation
    @contact = Contact.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Contact introuvable."
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
