class StreaksController < ApplicationController
  before_action :set_streak, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @streaks = current_user.streaks.all
    @activity = Activity.all
  end

  def all_streaks_index
    @activities = current_user.activities.all
    @streaks = current_user.streaks.all
  end

  def show
  end

  def new
    @streak = Streak.new
  end

  def edit
  end

  # POST /streaks
  def create
    @activity = Activity.find(params[:activity_id])
    @streak = Streak.new(streak_params)
    @streak.activity_id = @activity.id
    @streak.current_streak = 1
    @streak.reset = true

    respond_to do |format|
      if @streak.save
        format.html { redirect_to activity_streak_path(@streak.activity, @streak), notice: 'Streak was successfully created.' }
        format.json { render :show, status: :created, location: @streak }
      else
        format.html { render :new }
        format.json { render json: @streak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streaks/1
  def update
    respond_to do |format|
        @activity = Activity.find(params[:activity_id])
        @streak.current_streak += 1
        @streak.reset = true
        @streak.save!
        format.html { redirect_to activity_streak_path(@activity, @streak), notice: 'Streak was successfully updated.' }
        format.json { render :show, status: :ok, location: @streak }
    end
  end

  # DELETE /streaks/1
  def destroy
    @streak.destroy
    respond_to do |format|
      format.html { redirect_to activity_streaks_path, notice: 'Streak was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_streak
      @streak = Streak.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def streak_params
      params.require(:streak).permit(:start_date)
    end
end
