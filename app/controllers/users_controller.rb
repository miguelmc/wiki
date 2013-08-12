class UsersController < ApplicationController
  before_filter :is_admin?

  def index
    @users = User.all
  end

  def new
    @user = User.build
  end

  def create
    @user = User.build(params[:user])
    if @user.save
      redirect_to @users, flash: { notice: "User successfully created" }
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @users, flash: { notice: "User successfully modified" }
    else
      render 'edit'
    end
  end

  private
    def is_admin?
      if current_user && current_user.admin?
        true
      else
        redirect_to root_path, flash: { alert: "You're not allowed" }
      end
    end
end
