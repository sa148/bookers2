class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:profile_image)
  end

  def create
    @user = Book.new(book_params)
    @book.user_id =current_usre.id
    @book.save
    redirect_to book_path
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
  end

end
