class BooksController < ApplicationController
	
	def index
		@book = Book.search(params[:search])
  end

  def show
		@book=Book.find(params[:id])
  end

  def new
		@book=Book.new
  end

  def create
		@book=Book.new(params[:book])
		if @book.save
			redirect_to @book 
		else
			render :new	
		end
  end

  def edit
		@book=Book.find(params[:id])
  end

  def update
		@book=Book.new(params[:book])		
		if @book.update_attributes(params[:book])
			redirect_to @book
		else
			render :edit
		end
  end

  def destroy
		Book.find(params[:id]).try(:delete)
		redirect_to books_path
  end
end
