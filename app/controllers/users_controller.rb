class UsersController < ApplicationController
before_action :authenticate_user


  def index
    @book = Book.new
    @users = User.all
    @user = current_user # Userinfoを表示させる

    # @user = current_user
    # @books = @user.books.page(params[:user_id])
  end

  def show
    @book = Book.new
    @user = User.find(params[:id]) # Userinfoを表示させる
    @books = @user.books

  end

  def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to users_path
  end
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = 'You have updated User Info successfully.'
    redirect_to user_path(@user.id)
    else

      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def authenticate_user
    unless user_signed_in?
    redirect_to new_user_session_path
    end
  end


end
