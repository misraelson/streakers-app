module V1
 class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
      # we are making a call from the client to verify token from local storage on client side is verified
      # if current_user exists we return :ok
      current_user ? head(:ok) : head(:unauthorized)
    end

    def create
      @user = User.find_by(email: params[:email])
      # could👇 use shortform syntax => user&..valid_password
      if @user && @user.valid_password?(params[:password])
        render :create, status: :created
      else
        head(:unauthorized)
      end
    end

    def destroy
      current_user&.authentication_token = nil
      if current_user&.save
        head(:ok)
      else
        head(:unauthorized)
      end
    end
  end
end