class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #success go to profile page
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #short for user_url(@user)
    else
      #fail show errors and new page again
      render 'new'
    end
  end

  private
      def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
      end
end
