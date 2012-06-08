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
<<<<<<< HEAD
      @comment = Comentario.create params[:comentario]
      @comment[:user] = current_user.id
=======
      @comment = Comentario.new(params[:comentario])
      @comment[:user_id] = current_user.id
>>>>>>> 2c05d65856763c0beb1797f8206b8c873954ccdb
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
<<<<<<< HEAD
      flash[:error] = "Necesitas Autenticarte para realizar esta operación!"
=======
      flash[:error] = "Necesitas Autenticarte para hacer esto!"
>>>>>>> 2c05d65856763c0beb1797f8206b8c873954ccdb
      redirect_to login_path
    end
  end
end
