class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id =current_usre.id
    @book.save
    redirect_to book_path
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
  end

  def destroy
  end

   private

  def book_params
    params.require(:book).permit(:title, :opinion,)
  end

end
