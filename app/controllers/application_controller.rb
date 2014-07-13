require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load__news_categories

  check_authorization unless: :skip_authorization_check?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
  end

  def skip_authorization_check?
    devise_controller? || admin_controller?
  end

  def admin_controller?
    self.kind_of?(ActiveAdmin::BaseController)
  end

  def after_sign_in_path_for(resource)
    session['user_return_to'] || root_path
  end

  def load__news_categories
    @news_categories = NewsCategory.all
  end

end