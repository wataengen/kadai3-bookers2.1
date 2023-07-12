class UsersController < ApplicationController



  def index
    @book = Book.new
    @users = User.all
    # @user = current_user
    # @books = @user.books.page(params[:user_id])
  end

  def show

  end

  def edit
    @user = User.find(params[:id])
  end



end
