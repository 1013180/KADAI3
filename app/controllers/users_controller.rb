class UsersController < ApplicationController



   def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
   end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book　= Book.new
  end
   def index
       @user = current_user
       @users = User.all
   end
  def edit
    @user = User.find(params[:id])
  end
   def update
    @user = User.find(params[:id])
    @user.update(user_params)
     if @user.save
      redirect_to user_path(@user.id)
     else
      render :edit
     end
   end
     def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
     end
end
