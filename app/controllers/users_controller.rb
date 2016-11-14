class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :edit, :update, :destroy]

  def dashboard
    @restaurants = Restaurant.all
  end

  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def my_stars

  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end