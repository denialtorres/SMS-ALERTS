class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :credential, only: [:create]
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
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)
    
    puts "Creas la alerta"
    
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    
    Contact.all.each do |contact|
      puts contact.name
      puts contact.phone
      puts @alert.message
      @client.api.account.messages.create({
        :from => '+15627312206',
        :to => "+52#{contact.phone}",
        :body => @alert.message,
      })
    end  
    
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
      params.require(:alert).permit(:message)
    end
    
    def credential 
      @account_sid = 'AC248cb2931b0eef49ffa9e240e27c4a70'
      @auth_token = '19d8e06c60d72ee8e8c744d9e8b5dbc9'
    end
end
