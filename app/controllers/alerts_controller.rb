class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @categories = helpers.categories_collection
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)
    volunters = @alert.subscribed_users
    @alert.volunters = volunters.count
    set_coordinates(params[:search])
    query = helpers.get_state(@alert.latitude, @alert.longitude)
    @alert.zone =  helpers.get_zone(query)
    @alert.state = query.state
    
    respond_to do |format|
      if @alert.save
        format.html { redirect_to root_path, notice: 'alerta enviada exitosamente' }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: 'Alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @alert }
      else
        format.html { render :edit }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url, notice: 'Alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:message, :volunters, :latitude, :longitude, :state, :zone).merge(category_id: params[:category_id])
    end
    
    def set_coordinates(address)
      coordinates = GetCoordinates.call(address: address)
      @alert.latitude = coordinates[:latitude]
      @alert.longitude =  coordinates[:longitude]
    end
    
end
