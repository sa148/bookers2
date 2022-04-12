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
    redirect_to book_path
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
  end

  def destroy
  end

  private

  def  user_params
    params.require(:book).permit(:title, :opinion,)
  end
end
