class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user
		@new_book = Book.new
	end

	# def new
	# 	book = Book.new
	# end

	# def create
	# 	book = Book.new(book_params)
	# 	book.save
	# 	redirect_to book_path(book.id)
	# end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	private
	def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
	end
end