class ReviewsController < ApplicationController
  def new
  	@review = Review.new
  	respond_to do |format|
		 	format.html
  		format.json { render json: @review }
		end
  end

  def create
    if logged_in?
  	  @review = Review.create params[:review]
      @review[:user] = current_user.id
      @review[:book] = params["book"].to_i
      respond_to do |format|
        if @review.save
          format.html { redirect_back_or_to book_path(@review.book) }
          format.json { render json: @review, status: :created, location: @review }
        else
          format.html { redirect_to root_url }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Necesitas Autenticarte para realizar esta operación!"
      redirect_to login_path
    end
  end
end
