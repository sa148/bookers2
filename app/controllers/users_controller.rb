class UsersController < ApplicationController
before_action :correct_user, only: [:top]
before_action :authenticate_user!
  def new
    @user = User.new
    if @user.save
       redirect_to book_path(@book.id)
       flash[:notice] = "Welcome! You have signed up successfully."
    else
       render :new
    end
  end

  def user_params
    params.require(:user).permit(:profile_image)
  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
       flash[:notice] = "Signed in successfully."
       redirect_to user_path(@user_id)
    else
       render :login
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
        redirect_to user_path(@user_id)
        flash[:notice] = "You have updated user successfully."
    else
        render :edit
    end
  end

  def index
    @user = User.all
    @books = Book.all
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
    redirect_to 'homes#top'
  end

  private

  def  user_params
    params.require(:user).permit(:name, :password, :image, :introduction)
  end
end
