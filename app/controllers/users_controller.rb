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

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if !user
      user = User.create!(username: username)
      session[:user_id] = user.id
      flash[:success] = "Successfully created new user #{username} with ID #{user.id}"
    else
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{username}"
    end

    redirect_to root_path
  end

  private

  def user_params
    return params.require(:user).permit(:username)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
