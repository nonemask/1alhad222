class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  unless Rails.application.config.consider_all_requests_local
        rescue_from Exception, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActionController::Exceptioncaught, with: :render_404
  end
    private
    def render_404(exception)
         redirect_to root_path

  end
end
