class BooksController < ApplicationController


  def update
    book = Book.find(params[:id])
  unless book.user_id == current_user.id
    redirect_to books_path
  end
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = 'You have created book successfully.'
    redirect_to book_path(@book.id)
    else
      @user = current_user
      render :edit
    end
  end
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = 'You have created book successfully.'
    redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @user = current_user
    book = Book.find(params[:id])
  unless book.user_id == current_user.id
    redirect_to books_path
  end
    @book = Book.find(params[:id])

  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to '/books'

  end

  private
    def book_params
      params.require(:book).permit(:title, :body, :book_image)
    end



end
