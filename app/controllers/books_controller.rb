class BooksController < ApplicationController
  # belongs_to :user


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to '/books'
  end

  private
    def book_params
      params.require(:books).permit(:title, :opinion)
    end



end
