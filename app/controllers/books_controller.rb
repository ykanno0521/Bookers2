class BooksController < ApplicationController

  def index
		@books = Book.all
		@users = User.all
		@user = current_user
		@book = Book.new
  end

  def show
    @new_book = Book.new
  	@book = Book.find(params[:id])
  	@user = @book.user

  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
  	else
      @books = Book.all
      @user = current_user
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body,)
  end

end
