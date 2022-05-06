class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless current_user === @user
  end

  def update
    @user = current_user
    if @user.update(user_params)
        redirect_to user_path(current_user)
        flash[:success] = 'update successfully'
      else
        render :edit
        flash[:danger] = 'update error'
      end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
