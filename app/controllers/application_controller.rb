# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
