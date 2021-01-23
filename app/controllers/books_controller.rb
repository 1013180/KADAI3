class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
     @book = Book.find(params[:id])
     @book_new = Book.new()
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
      @book.update(book_params)
   if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
   else
      render :edit
   end
   end

    # def update
    # @book = Book.find(params[:id])
    # if @book.update(book_params)
    # flash[:notice] = "Book was successfully updated."
    # redirect_to book_path(@book)
    # else
    # render :edit
    # end
    # end


    private

  def book_params
    params.permit(:title, :body, :user_id )
  end

end
