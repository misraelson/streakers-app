class StreaksController < ApplicationController
  before_action :set_streak, only: [:show, :edit, :update, :destroy]

  # GET /streaks
  # GET /streaks.json
  def index
    @streaks = Streak.all
  end

  # GET /streaks/1
  # GET /streaks/1.json
  def show
  end

  # GET /streaks/new
  def new
    @streak = Streak.new
  end

  # GET /streaks/1/edit
  def edit
  end

  # POST /streaks
  # POST /streaks.json
  def create
    @streak = Streak.new(streak_params)

    respond_to do |format|
      if @streak.save
        format.html { redirect_to @streak, notice: 'Streak was successfully created.' }
        format.json { render :show, status: :created, location: @streak }
      else
        format.html { render :new }
        format.json { render json: @streak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streaks/1
  # PATCH/PUT /streaks/1.json
  def update
    respond_to do |format|
      if @streak.update(streak_params)
        format.html { redirect_to @streak, notice: 'Streak was successfully updated.' }
        format.json { render :show, status: :ok, location: @streak }
      else
        format.html { render :edit }
        format.json { render json: @streak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streaks/1
  # DELETE /streaks/1.json
  def destroy
    @streak.destroy
    respond_to do |format|
      format.html { redirect_to streaks_url, notice: 'Streak was successfully destroyed.' }
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
      params.require(:streak).permit(:current_streak, :start_date, :end_date)
    end
end
