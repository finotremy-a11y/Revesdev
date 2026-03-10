module Admin
  class BaseController < ApplicationController
    before_action :require_admin!

    layout "admin"

    private

    def require_admin!
      unless Current.user.email_address == "remyfinot.pro@gmail.com"
        redirect_to root_path, alert: "Accès refusé. Vous n'êtes pas administrateur."
      end
    end
  end
end
