class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.present?
      sign_in @user
      binding.pry
      redirect_to root_path
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :twitter, :all

  def failure
    redirect_to root_path
  end
end