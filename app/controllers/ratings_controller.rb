class RatingsController < ApplicationController
  # before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @rating = Rating.find(params[:ratee_id])
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @event = Event.find_by(params[:event_id])
    p @ratee
    @rating = Rating.new(rating_params)
    @rating.rater_id = current_user.id

    respond_to do |format|
      if @rating.save
        format.html { redirect_to user_ratings_path(@ratee), notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: user_ratings_path(@ratee) }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:event_id, :rating, :rating_feedback, :rater_id, :ratee_id, :user_id)
    end
end
