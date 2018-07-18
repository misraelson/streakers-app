module V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      binding.pry
      @user = User.new(user_params)

      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :authentication_token)
    end
  end
end
