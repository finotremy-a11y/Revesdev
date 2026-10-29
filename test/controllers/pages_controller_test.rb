require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should get services" do
    get services_url
    assert_response :success
  end

  test "should get secteur public" do
    get secteur_public_url
    assert_response :success
    assert_select "h1", /marchés publics/
    assert_select "a[href=?]", new_contact_path
  end

  test "home shows new positioning and links to secteur public" do
    get root_url
    assert_select "h1", /logiciels métiers et solutions IA sur-mesure/
    assert_select "a[href=?]", secteur_public_path
    assert_select "#methode"
  end

  test "services page shows the three result-oriented services" do
    get services_url
    assert_select "h3", "Logiciels et Applications sur-mesure"
    assert_select "h3", "Automatisation"
    assert_select "h3", "Intégration d'Intelligence Artificielle"
  end

  test "mentions legales shows the SIRET" do
    get mentions_legales_url
    assert_select "dd", "88 30 06 124 000 35"
  end

  test "sitemap lists secteur public" do
    get sitemap_url(format: :xml)
    assert_response :success
    assert_includes response.body, secteur_public_url
  end

  test "every public page has a main landmark, a skip link and one h1" do
    [ root_url, about_url, services_url, secteur_public_url, projects_url, new_contact_url,
      mentions_legales_url, politique_confidentialite_url, cgu_url ].each do |url|
      get url
      assert_select "main#main-content", 1, "main manquant sur #{url}"
      assert_select "a[href='#main-content']", 1
      assert_select "h1", 1, "h1 attendu sur #{url}"
    end
  end

  test "navigation exposes the current page and a mobile menu" do
    get services_url
    assert_select "nav[aria-label='Navigation principale'] a[aria-current='page']", minimum: 1
    assert_select "details summary[aria-label='Menu']"
  end
end
