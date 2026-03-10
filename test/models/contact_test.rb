require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    contact = Contact.new(name: "John", email: "john@doe.com", message: "Bonjour c'est un message très complet")
    assert contact.valid?
  end

  test "should not be valid without name" do
    contact = Contact.new(email: "john@doe.com", message: "Bonjour c'est un très long message")
    assert_not contact.valid?
    assert_not_nil contact.errors[:name]
  end

  test "should not be valid with invalid email" do
    contact = Contact.new(name: "John", email: "invalid_email", message: "Bonjour c'est un très long message")
    assert_not contact.valid?
    assert_not_nil contact.errors[:email]
  end

  test "should not be valid with short message" do
    contact = Contact.new(name: "John", email: "john@doe.com", message: "Court")
    assert_not contact.valid?
    assert_not_nil contact.errors[:message]
  end
end
