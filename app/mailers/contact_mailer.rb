class ContactMailer < ApplicationMailer
  default to: "remyfinot.pro@gmail.com"
  layout false

  def new_contact_email
    @contact = params[:contact]
    mail(
      from:     "RêvesDev Contact <contact@revesdev.fr>",
      reply_to: @contact.email,
      subject:  "Nouveau Message de: #{@contact.name} - #{@contact.subject.presence || 'Sans sujet'}"
    )
  end
end
