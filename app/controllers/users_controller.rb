class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @proto = @user.prototypes
  end
end
