require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact, trigger job and redirect" do
    assert_difference("Contact.count", 1) do
      post contacts_url, params: {
        contact: {
          name: "Test",
          email: "test@email.com",
          subject: "Sujet",
          message: "Voici un message de test qui a la bonne longueur"
        }
      }
    end

    assert_redirected_to root_url
    assert_equal "Merci pour votre message. Je vous recontacte très vite !", flash[:notice]
  end
end
