class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :admin_required

  private

  def admin_required
    redirect_back(fallback_location: hospitals_path) unless current_admin
  end
end
