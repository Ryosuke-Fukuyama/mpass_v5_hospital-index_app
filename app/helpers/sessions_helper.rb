module SessionsHelper
  def log_in(admin_pass)
    session[:admin_pass_id] = admin_pass.id
  end
  def log_out
    session.delete(:admin_pass_id)
    @current_admin_pass = nil
  end
  def current_admin_pass
    @current_admin_pass ||= AdminPass.find_by(id: session[:admin_pass_id])
  end
  def logged_in?
    !current_admin_pass.nil?
  end
end