class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    puts "IN NEW METHOD"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end
  def show
      @user = User.find(params[:id])
  end
  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.update(params[:id], user_params)
    redirect_to '/users/index'
  end
  def destroy
      @user = User.destroy(params[:id])
      @user.delete
      redirect_to '/users/index'

  end
  def Edit_User
      @user = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
