class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:q])
  end

  def create
    @user = User.new(params[:q])
    if @user.save
      redirect_to action: "show", id: @user.id
    else
      redirect_to action: "new"
    end
  end

private

  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end

end
