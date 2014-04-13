class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    omniauth = request.env['omniauth.auth']

    data = {
        provider: omniauth.provider,
        uid: omniauth.uid,
        access_token: omniauth.credentials.token,
        expires_at: omniauth.credentials.expires_at,
        refresh_token: omniauth.credentials.refresh_token,
        email: omniauth.info.email
    }

    if authorization = Authorization.find_by_provider_and_uid(data[:provider], data[:uid])
      if data[:access_token] != authorization.access_token
        authorization.update_attributes! access_token: omniauth.credentials.token,
                                         expires_at: omniauth.credentials.expires_at,
                                         refresh_token: omniauth.credentials.refresh_token
      end

      sign_in_and_redirect authorization.user
    elsif current_user
      # TODO: NYI
      current_user.create_authorization data

      redirect_to after_sign_in_path_for(current_user)
    else
      user = User.create_by_oauth! data

      sign_in_and_redirect user
    end
  end

  def failure
    redirect_to root_path
  end

  # This is solution for existing accout want bind Google login but current_user is always nil
  # https://github.com/intridea/omniauth/issues/185
  def handle_unverified_request
    true
  end
end
