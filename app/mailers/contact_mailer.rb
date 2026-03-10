class ContactMailer < ApplicationMailer
  default to: "remyfinot.pro@gmail.com"

  def new_contact_email
    @contact = params[:contact]
    mail(
      from: @contact.email,
      subject: "Nouveau Message de: #{@contact.name} - #{@contact.subject.presence || 'Sans sujet'}"
    )
  end
end
