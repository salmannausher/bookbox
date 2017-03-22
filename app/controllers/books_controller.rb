class BooksController < ApplicationController
before_action :find_book, only:[:show, :edit, :update, :destroy, :upvote]
before_action :authenticate_user!
	def index
		@books = Book.all.order('created_at DESC')
	end

	def show
	end

	def edit
	end

	def update
		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end
def destroy
	@book.destroy
	redirect_to root_path, notice: "successfully deleted"
end

    def new
		@book =Book.new
		
	end

	def create
		@book =Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to @book
		else
			render 'new'
		end
	end

	private

	def find_book
		@book=Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:title, :description, :image)
	end
end
