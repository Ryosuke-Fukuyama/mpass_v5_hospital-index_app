class SessionsController < ApplicationController
  skip_before_action :admin_required, only: %i[create]

  # def new; end
  def create
    if admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
    else
      flash.now[:danger] = t('notice.login_false')
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to hospitals_path, notice: t('notice.logout')
  end
end
