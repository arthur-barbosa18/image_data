# frozen_string_literal: true

module Api
  module V1
    # :nodoc:
    class ApiController < ApplicationController
      include AbstractController::Helpers
      include Concerns::ApiActions
      include Concerns::CrudActions

      rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    end
  end
end
