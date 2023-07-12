class UsersController < ApplicationController



  def index

    # @user = current_user
    # @books = @user.books.page(params[:user_id])
  end

  def show
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end



end
