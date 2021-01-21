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
       @Books = Book.all
   end
  def edit
    @user = User.find(params[:id])
  end
   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
   end
     def user_params
    params.require(:user).permit(:name, :profile_image)
     end
end
