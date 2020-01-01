# frozen_string_literal: true

RailsAdmin.config do |config|
  config.parent_controller = 'ApplicationController'
  config.authenticate_with { warden.authenticate! scope: :user }
  config.current_user_method(&:current_user)
  config.authorize_with :cancancan
  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
