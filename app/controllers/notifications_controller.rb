class NotificationsController < ApplicationController
  def index
    if logged_in?
      @notifications = Notification.where receptor: current_user.id
      respond_to do |format|
        format.html
        format.json { render json: @notifications }
      end
    else
      flash[:error] = "Necesitas Autenticarte para ver las notificaciones!"
      redirect_to login_path
    end
  end

  def show
    @notification = Notification.find(params[:id])
    if current_user.id == @notification.receptor
      @book = Book.find(@notification.book_id)
      @notification[:leido] = true
      respond_to do |format|
        if @notification.update_attributes(params[:notification])
          format.html { redirect_to @notification }
          format.json { render json: @notification, status: :created, location: @notification }
        else
          format.html { redirect_to notifications_path, errors: 'Error Al leer!' }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Esta notificacion no te pertenece!"
      redirect_to login_path
    end
  end

  def new
    @notification = Notification.new
    respond_to do |format|
      format.html
      format.json { render json: @notifications }
    end
  end

  def create
    if logged_in?
      @notification = Notification.new(params[:notification])
      @notification[:book_id] = params[:book].to_i
      @notification[:receptor] = params[:receptor].to_i
      @notification[:user_id] = current_user.id
      @notification[:tipo] = params[:tipo].to_i #Tipos: 1=>Prestamo, 2=>Devolucion, 3=>Recordatorio
      @notification[:leido] = false
      respond_to do |format|
        if @notification.save
          format.html { redirect_to @notification, notice: 'Nueva Notificacion!.' }
          format.json { render json: @notification, status: :created, location: @notification }
        else
          format.html { render action: "new" }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Necesitas Autenticarte para hacer esto!"
      redirect_to login_path
    end
  end

  def destroy
    @notifications = Notification.find(params[:id]).try(:delete)
    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.json { head :no_content }
    end
  end
end
