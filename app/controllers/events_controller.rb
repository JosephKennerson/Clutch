class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    # Event.all.each do |e|
    #   e.close_event
    # end
    # open_events = Event.where(status: true)
    if params[:q].nil?
      @events = Event.all
    else
      if params[:commit] == "Submit"
        p "inside the submit"

      elsif params[:commit] == "All events"
        p "inside the elsif"
        @events = open_events
      else
        @events = Event.search(params[:q])
        # @events = open_events.search(params[:q]).records.where(category: params[:category_params])
      end
      # query = [params[:q], params[:dropq]].join(", ")
      # @events = open_events.__elasticsearch__.search(query).records
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comment = Comment.new
    @rating = Rating.new
    respond_to do |format|
      format.html {render layout: false}
      # format.html
      format.json
    end
  end

  def search
    if params[:search].present?
      @events = Event.search(params[:search])
    else
      @events = Events.all
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.host_id = current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map
    # Event.where(status: false).each do |event|
    #   event.close_event
    # end
    open_events = Event.where(status: true)
    if params[:q].nil?
      @events = open_events
    else
      query = [params[:q], params[:dropq]].join(", ")
      @events = open_events.search(query).records
    end
    # @events = Event.where(status: true)
    @geojson = Array.new
    p @events.length
    p @geojson.length
    build_geojson(@events, @geojson)
    p "*" * 80
    p @events.length
    p @geojson.length
    respond_to do |format|
      format.html {render layout: false}
      format.json {render json: @geojson}
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:public_location, :address_line_1, :address_line_2, :city, :state, :zip, :max_size, :host_id, :time_start, :time_end, :name, :description, :category, :status, :approval_required)
    end

    def build_geojson(events, geojson)
      events.each do |event|
        geojson << GeojsonBuilder.build_event(event)
      end
    end

    def resolve_layout
      case get
        when "index"
          "no_wrap"
        else
          "application"
        end
    end

end
