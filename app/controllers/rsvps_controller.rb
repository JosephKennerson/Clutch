class RsvpsController < ApplicationController
  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
  end

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit
  end

  # # POST /rsvps
  # # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)
    @event = Event.find(@rsvp.event_id)
    respond_to do |format|
      if @rsvp.save
        if request.xhr?
        format.html { render :makebutton, layout: false }
          format.json { render :show, status: :created, location: @rsvp }
        end
        format.html { redirect_to events_path, notice: 'Rsvp was successfully created.' }
        format.json { render :show, status: :created, location: @rsvp }
      else
        format.html { render :new }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsvps/1
  # PATCH/PUT /rsvps/1.json
  def update
    respond_to do |format|
      if params[:confirmed] == true
        @rsvp.confirmed = true
      else
        @rsvp.confirmed = false
      end
      if @rsvp.update(rsvp_params)
        format.html { redirect_to events_path, notice: 'Rsvp was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsvp }
      else
        format.html { render :edit }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Rsvp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ==========================================
  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)
    @guest = User.find(@rsvp.guest_id)
    @event = Event.find(@rsvp.event_id)
    @host = User.find(@event.host_id)

    respond_to do |format|
      if @rsvp.save
        if @event.approval_required == true
          # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @guest.phone_number,
            body: "Thank you for choosing this clutch. Your request is being processed"
          )
          # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @host.phone_number,
            body: "You have a pending request from #{@guest.username}."
          )
        else
              # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @guest.phone_number,
            body: "Thank you for choosing this clutch. Welcome to our team!"
          )
          # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @host.phone_number,
            body: "#{@guest.username} has joined your event #{@event.name}."
          )
        end
        if request.xhr?
          format.html { render :makebutton, layout: false }
            format.html { render :show, status: :created, location: @rsvp }
        end

        format.html { redirect_to events_path, notice: 'Rsvp was successfully created.' }
        format.json { render :show, status: :created, location: @rsvp }
      else
        format.html { render :new }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsvps/1
  # PATCH/PUT /rsvps/1.json
  def update
    @guest = User.find(@rsvp.guest_id)
    @event = Event.find(@rsvp.event_id)
    @host = User.find(@event.host_id)
    respond_to do |format|
      if params[:confirmed] == true
        @rsvp.confirmed = true
      else
        @rsvp.confirmed = false

      end
      if @rsvp.update(rsvp_params)

        # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @guest.phone_number,
            body: "Welcome to our clutch. Your request join #{@event.name} has been accepted."
          )
        format.html { redirect_to events_path, notice: 'Rsvp was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsvp }
      else

        # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @guest.phone_number,
            body: "Sorry. Your request join #{@event.name} has been declined :-(."
          )
        format.html { render :edit }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @guest = User.find(@rsvp.guest_id)
    @event = Event.find(@rsvp.event_id)
    @host = User.find(@event.host_id)
    @rsvp.destroy
    # Instantiate a Twilio client
          client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

          # Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: @host.phone_number,
            body: "#{@guest.username} has cancelled. Hence he is not a part of this clutch @event.name."
          )
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Rsvp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # ====================================

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:guest_id, :event_id, :pending, :confirmed, :confirm)
    end
end
