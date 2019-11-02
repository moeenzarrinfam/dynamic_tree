# frozen_string_literal: true

class ApplicationController < ActionController::API
  def root
    render json: "welcome to #{ENV.fetch('PROJECT_NAME', Rails.application.class.parent_name)}"
  end
end
