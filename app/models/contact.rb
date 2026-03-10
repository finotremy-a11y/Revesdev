class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { minimum: 10 }

  after_create_commit :send_notification_email

  private

  def send_notification_email
    ContactMailer.with(contact: self).new_contact_email.deliver_later
  end
end
