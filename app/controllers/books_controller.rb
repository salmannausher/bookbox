class BooksController < ApplicationController
before_action :find_book, only:[:show, :edit, :update, :destroy, :upvote]
before_action :authenticate_user!, except: [:index, :show]
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
		if @book.save
			redirect_to @book
		else
			render 'new'
		end
	end

def upvote
	 @book = Book.find(params[:id])
  @book.upvote_by current_user
  redirect_to books_path
end

	private

	def find_book
		@book=Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:title, :description, :image)
	end
end
