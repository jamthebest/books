class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where receptor: current_user.id
    respond_to do |format|
      format.html
      format.json { render json: @notifications }
    end
  end

  def show
    @notification = Notification.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @notifications }
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
    @notification = Notification.new(params[:notification])
    @notification[:book_id] = params[:book].to_i
    @notification[:receptor] = params[:receptor].to_i
    @notification[:user_id] = current_user.id
    @notification[:tipo] = params[:tipo].to_i
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
  end

  def destroy
    @notifications = Notification.find(params[:id]).try(:delete)
    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.json { head :no_content }
    end
  end
end
