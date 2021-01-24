class UsersController < ApplicationController
 before_action :authenticate_user!


   def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
     if @user.save
      flash[:notice] = "successfully"
      redirect_to users_path
     else
      render("users/new")
     end
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
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
     else
      render :edit
     end
   end
     def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
     end
end
