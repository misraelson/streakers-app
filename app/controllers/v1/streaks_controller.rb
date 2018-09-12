module V1
  # Manages the Streak model
  class StreaksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_streak, only: [:update]
    before_action :set_activity, only: [:create]

    # POST /streaks
    def create
      # @streak = Streak.new(streak_params)
      @streak = Streak.new
      @streak.activity_id = @activity.id
      @streak.current_streak = 1

      if @streak.save
        render :create, status: :created
      else
        head(:unprocessable_entity)
      end
    end

    def index
      @streaks = current_user.streaks.all.order("created_at ASC")
      @activity = Activity.all
      render :index, status: :ok
    end

    def all_streaks_index
      @activities = current_user.activities.all
      @streaks = current_user.streaks.all
    end


    # PATCH/PUT /streaks/1
    def update
      @streak.current_streak += 1
      @streak.reset = true

      if @streak.save
        # render json: { success: true, streak: @streak }
        render :update, status: :ok
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

    def edit
    end

    def show
    end

    def new
      @streak = Streak.new
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_streak
        @streak = Streak.find(params[:id])
      end

      def set_activity
        @activity = Activity.find(params[:activity_id])
      end

      def streak_params
        params.require(:streak).permit(:current_streak, :reset, :status, :activity_id)
      end
  end
end
