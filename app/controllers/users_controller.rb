class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user] != nil
      @user.update(:avatar => params[:user][:avatar]) if params[:user][:avatar] != nil
      @user.update(:resume => params[:user][:resume]) if params[:user][:resume] != nil
      redirect_to :back
    end
  end
end
