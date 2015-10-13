class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

    # def facebook
    #   user = User.form_omniauth(request.env["omniauth.auth"])
    #   if user.persisted?
    #     sign_in_and_redirect user, notice: "Signed in!"
    #   else
    #     redirect_to new_user_registration_url
    #   end
    # end
end