class SessionsController < ApplicationController
  skip_before_action :admin_pass_required, only: %i[create]

  def create
    admin_pass = AdminPass.find(1)
    if admin_pass.authenticate(params[:session][:password])
      log_in admin_pass
      redirect_to hospitals_path, notice: t('notice.sign_in')
    else
      flash.now[:danger] = t('notice.authentication_failure')
    end
  end

  def destroy
    log_out
    redirect_to hospitals_path, notice: t('notice.sign_out')
  end
end
