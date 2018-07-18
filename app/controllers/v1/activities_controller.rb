module V1
  class ActivitiesController < ApplicationController
    # include V1::Activities::Response

    def index
      @activities = current_user.activities.all
      # @streak
      render :index, status: :ok
    end

  end
end
