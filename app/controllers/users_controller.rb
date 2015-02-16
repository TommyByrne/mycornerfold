class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])


    @likes = @user.likes
  end
end
