class ComentariosController < ApplicationController
  def new
    @comment = Comentario.new
    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def create
    if logged_in?
      @comment = Comentario.new(params[:comentario])
      @comment[:user_id] = current_user.id
      @comment[:perfil] = params["perfil"].to_i
      respond_to do |format|
        if @comment.save
          format.html { redirect_to user_path(@comment.perfil) }
          format.json { render json: @comment, status: :created, location: @comment }
        else
          format.html { redirect_to root_url }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Necesitas Autenticarte para hacer esto!"
      redirect_to login_path
    end
  end
end
