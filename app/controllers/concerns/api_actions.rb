module Concerns
  module ApiActions
    extend ActiveSupport::Concern

    def render_forbidden(_exception)
      render nothing: true, status: :forbidden
    end

    def render_unprocessable(exception)
      data = exception.record if exception.respond_to?(:record)
      data = data.errors if data.present?
      data ||= exception
      render json: data, status: :unprocessable_entity
    end

    def render_not_found(exception)
      render json: { error: exception.message }, status: :not_found
    end
  end
end
