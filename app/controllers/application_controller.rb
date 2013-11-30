class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' ||  c.request.format == 'text/json'}
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end