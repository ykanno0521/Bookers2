class UsersController < ApplicationController
before_action :authenticate_user!

	def index
		@users = User.all
		@user = current_user
		@new_book = Book.new
	end

	# def new
	# 	book = Book.new
	# end

	def create
		@new_book = Book.new(book_params)
	  if @new_book.save
    	flash[:notice] = "successfully"
    	redirect_to book_path(book.id)
  	else
    	render 'books/index'
    end
  end

	def show
		@user = User.find(params[:id])
		@new_book = Book.new
		@books = @user.books

	end

	def edit
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = "error"
      redirect_to user_path(current_user.id)
    end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
      flash[:notice] = "successfully"
		  redirect_to user_path(@user.id)
    else
      render action: :edit
    end
	end

	private
	def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
	end
end