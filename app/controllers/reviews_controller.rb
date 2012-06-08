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
      @review[:user_id] = current_user.id
      @review[:book_id] = params["book_id"].to_i
      respond_to do |format|
        if @review.save
          format.html { redirect_to book_path(@review.book_id) }
          format.json { render json: @review, status: :created, location: @review }
        else
          format.html { redirect_to root_url }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Necesitas Autenticarte para hacer esto!"
      redirect_to login_path
    end
  end
end
