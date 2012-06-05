class BooksController < ApplicationController
	
	def index
		@books = Book.search(params[:search])
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book }
    end
  end

  def show
		@book=Book.find(params[:id])
		@review = Review.new
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book }
    end
  end

  def new
		@book=Book.new
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book }
    end
  end

  def create
		@book=Book.new(params[:book])
		@book[:disponibilidad] = true
		@book[:user_id] = current_user.id
		@book[:t_prestamo] = params[:book][:t_prestamo].to_s
		respond_to do |format|
			if @book.save
				format.html { redirect_to @book, notice: 'Libro Agregado!.' }
        format.json { render json: @book, status: :created, location: @book }
			else
				format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
			end
		end
  end

  def edit
		@book=Book.find(params[:id])
  end

  def update
		@book=Book.new(params[:book])
		respond_to do |format|
			if @book.update_attributes(params[:book])
				format.html { redirect_to @book, notice: 'Libro Agregado!.' }
        format.json { render json: @book, status: :created, location: @book }
			else
				format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
			end
		end
  end

  def destroy
		Book.find(params[:id]).try(:delete)
		respond_to do |format|
      format.html { redirect_to books_path }
      format.json { head :no_content }
  	end
  end
end
