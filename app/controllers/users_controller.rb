class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @likes = current_user.likes

   end
end
