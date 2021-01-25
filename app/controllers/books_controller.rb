class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_book, only: [:edit, :update, :destroy]




  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
          flash[:notice] = "successfully"
          redirect_to book_path(@book.id)
      else
      @user = current_user
      @books = Book.all
          render :index
      end
  end

  def index
      @book = Book.new
      @books = Book.all
      @user = current_user
  end

  def show
      @book = Book.find(params[:id])
      @book_new = Book.new
      @user = @book.user
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end


  def edit
      @book = Book.find(params[:id])
  end



  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
          flash[:notice] = "successfully"
          redirect_to book_path(@book.id)
      else
          render :edit
      end
  end


  private

  def book_params
      params.require(:book).permit(:title, :body, :user_id )
  end

  def correct_book
      @book = Book.find(params[:id])
      if @book.user != current_user
          redirect_to books_path
      end
  end
end
