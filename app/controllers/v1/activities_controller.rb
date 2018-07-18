module V1
  class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token
    # include V1::Activities::Response

    def index
      @activities = current_user.activities.all
      # @streak
      render :index, status: :ok
    end

    def create
      @activity = Activity.new(activity_params)
      @activity.user_id = current_user.id

      if @activity.save
        render :create, status: :created
      else
        render @activity.errors, status: :unprocessable_entity
      end
    end

    # DELETE v1/activities/1
    def destroy
      binding.pry
      @activity = current_user.activities.find_by(id: params[:id])
      if @activity.destroy
        # head is rails way of returning just content in the header => no content in the response
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private

    def activity_params
      params.require(:activity).permit(:title)
    end


  end
end
