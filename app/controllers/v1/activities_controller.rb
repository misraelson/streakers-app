module V1
  # Activities endpoints
  class ActivitiesController < ApplicationController
    include V1::Activities::Response
    # skip_before_action :verify_authenticity_token
    before_action :set_activity, only: [:update]

    def index
      @activities = current_user.activities.all.order("created_at ASC")
      # render json: @activities.as_json(only: [:id, :title, :user_id], include: :streaks), status: :ok
      render :index, status: :ok
    end

    def create
      activity = Activity.new(activity_params)
      activity.user_id = current_user.id
      # did some basic code refactor => created a concern module to hand the creation json render & error handle
      create_and_render_activity(activity) || render_invalid_response

    end

    def update
      if @activity.update_attributes(activity_params)
        # render json: @activity.to_json(only: [:id, :title, :user_id], include: :streaks)

        render :update, status: :ok
      else
        render @activity.errors, status: :unprocessable_entity
      end

    end

    # DELETE v1/activities/1
    def destroy
      @activity = current_user.activities.find(params[:id])
      if @activity.destroy
        # head is rails way of returning just content in the header => no content in the response
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private

    def set_activity
      @activity = current_user.activities.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:title)
    end

  end
end
