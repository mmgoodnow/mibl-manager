# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to main_app.root_path, alert: exception.message
  # end

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
