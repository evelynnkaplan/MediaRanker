class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    if !user
      flash[:error] = "No user with that ID found."
      redirect_to users_path
    end
  end

  def login_form
    @user = User.new
  end

  private

  def user_params
    return params.require(:user).permit(:username)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
