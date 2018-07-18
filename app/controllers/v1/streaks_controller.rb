module V1
  # Manages the Streak model
  class StreaksController < ApplicationController
    # POST /streaks
    def create
      @activity = Activity.find(params[:activity_id])
      @streak = Streak.new(streak_params)
      @streak.activity_id = @activity.id
      @streak.current_streak = 1
      @streak.reset = true

      if @streak.save
        render :create, status: :created
      else
        head(:unprocessable_entity)
      end
    end

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


    # PATCH/PUT /streaks/1
    def update
      @activity = Activity.find(params[:activity_id])
      @streak.current_streak += 1
      @streak.reset = true

      if @streak.update(streak_params)
        render :update
      else
        head(:unprocessable_entity)
      end
    end

    # DELETE /streaks/1
    def destroy
      if @streak.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_streak
        @streak = Streak.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def streak_params
        params.require(:streak).permit(:current_streak, :start_date, :end_date, :reset, :status)
      end
  end
