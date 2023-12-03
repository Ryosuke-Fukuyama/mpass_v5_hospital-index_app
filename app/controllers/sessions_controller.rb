class SessionsController < ApplicationController
  skip_before_action :admin_required, only: %i[create]

  # def new; end
  def create
    if admin.authenticate(params[:session][:password])
      log_in admin
    else
      flash.now[:danger] = t('notice.login_false')
    end
  end

  def destroy
    log_out
  end
end
