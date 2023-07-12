class UsersController < ApplicationController



  def index
    @book = Book.new
    @users = User.all
    @user = current_user
    # @user = current_user
    # @books = @user.books.page(params[:user_id])
  end

  def show
    @book = Book.new
    @user = current_user
    @books = @user.books

  end

  def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to books_path
  end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to books_path
  end
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to users_path(@user.id)
    else

      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end


end
