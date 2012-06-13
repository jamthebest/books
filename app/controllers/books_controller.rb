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
		@noti = Notification.new
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book }
    end
  end

  def new
  	if logged_in?
			@book=Book.new
			respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @book }
	    end
	  else
      flash[:error] = "Necesitas Autenticarte para hacer esto!"
      redirect_to login_path
    end
  end

  def create
  	if logged_in?
			@book=Book.new(params[:book])
			@book[:disponibilidad] = true
			@book[:user_id] = current_user.id
			@book[:user_pres] = 0
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
		else
      flash[:error] = "Necesitas Autenticarte para hacer esto!"
      redirect_to login_path
    end
  end

  def edit
		@book=Book.find(params[:id])
  end

  def update
  	if params[:noti]
			@book = Book.find(params[:id])
			@book[:user_pres] = params[:user_pres].to_i
			@book[:disponibilidad] = params[:disponibilidad]
			respond_to do |format|
				if @book.update_attributes(params[:book])
					format.html { redirect_to @book, notice: 'Libro Prestado!.' }
		      format.json { render json: @book, status: :created, location: @book }
				else
					format.html { render action: "new" }
		      format.json { render json: @book.errors, status: :unprocessable_entity }
				end
			end
		else
		 	if current_user.id == Book.find(params[:id]).user_id
				@book=Book.new(params[:book])
				@book[:user_pres] = 0
				respond_to do |format|
					if @book.update_attributes(params[:book])
						format.html { redirect_to @book, notice: 'Libro Actualizado!.' }
		        format.json { render json: @book, status: :created, location: @book }
					else
						format.html { render action: "new" }
		        format.json { render json: @book.errors, status: :unprocessable_entity }
					end
				end
			else
		    flash[:error] = "No puedes modificar las propiedades de este Libro!"
		    redirect_to @book
		  end
		end
  end

  def destroy
  	if current_user.id == Book.find(params[:id]).user_id
			Book.find(params[:id]).try(:delete)
			respond_to do |format|
	      format.html { redirect_to books_path }
	      format.json { head :no_content }
	  	end
	  else
      flash[:error] = "No puedes eliminar este Libro!"
      redirect_to @book
    end
  end
end
