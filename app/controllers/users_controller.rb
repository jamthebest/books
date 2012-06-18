class UsersController < ApplicationController
def index
     @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
		@comment = Comentario.new
    @comment = Comentario.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
     @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    @user[:reputacion] = 10
    respond_to do |format|
     if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'Usuario Creado!' }
        format.json { render json: @user, status: :created, location: @user }
     else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.id == User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, notice: 'Usuario Actualizado!' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "No puedes Modificar este Usuario!"
      redirect_to @user
    end
  end

  def destroy
    if current_user.id == User.find(params[:id])
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
    	end
    else
      flash[:error] = "No puedes Eliminar este Usuario!"
      redirect_to @user
    end
	end
end
