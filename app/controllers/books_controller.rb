class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
     @book.user_id =current_usre.id
    @books = Book.all
    @book.save
    redirect_to book_path(id: current_user)
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to  user_path(id: current_user)
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
  end

   private

  def book_params
    params.require(:book).permit(:title, :opinion,)
  end

end
