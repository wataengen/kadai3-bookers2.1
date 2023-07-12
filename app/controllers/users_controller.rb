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
    @user = User.find(params[:id])
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
  end



end
