require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "new_contact_email" do
    contact = contacts(:one)
    mail = ContactMailer.with(contact: contact).new_contact_email
    assert_equal "Nouveau Message de: MyString - MyString", mail.subject
    assert_equal [ "remyfinot.pro@gmail.com" ], mail.to
    assert_equal [ "contact@revesdev.fr" ], mail.from
  end
end
