class ApplicationController < ActionController::API
  before_filter :google_login, except: [:set_google_drive_token]

  def google_login
    unless $drive.get_credentials
      redirect_to('/oauth2callback')
    end
  end
end
