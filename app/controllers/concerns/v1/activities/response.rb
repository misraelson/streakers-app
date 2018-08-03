# frozen_string_literal: true

module V1
  module Activities
    # Response for Activities Controller
    module Response
      extend ActiveSupport::Concern

      def create_and_render_activity(activity)
        activity.save && render(:create, status: :created, locals: { activity: activity})
      end

      def render_activity(activity)
        render(:update, status: :ok, locals: { activity: activity})
      end

      def render_invalid_response
        head(:unprocessable_entity)
      end
    end
  end
end
