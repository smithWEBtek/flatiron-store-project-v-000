class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy 
  end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end 

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
