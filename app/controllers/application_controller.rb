# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :phone_number, :date_of_birth])
  end

  private

  def after_sign_in_path_for(resource)
    pages_show_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
