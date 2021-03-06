# frozen_string_literal: true

class ApplicationController < ActionController::API
  def root
    render json: "welcome to #{ENV.fetch('PROJECT_NAME', Rails.application.class.parent_name)}"
  end

  rescue_from Mongoid::Errors::DocumentNotFound do |_exception|
    render json: { errors: [I18n.t('activerecord.exceptions.not_found')] }, status: :not_found
  end
end
