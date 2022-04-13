class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:profile_image)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id =current_usre.id
    @book.save
    redirect_to book_path(id: current_user)
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
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

  def  user_params
    params.require(:book).permit(:title, :opinion,)
  end
end
