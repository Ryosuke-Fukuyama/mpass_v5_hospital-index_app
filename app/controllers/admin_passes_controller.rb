class AdminPassesController < ApplicationController
  skip_before_action :admin_pass_required, only: %i[create]

  def create
    @admin_pass = AdminPass.new(admin_pass_params)
    @admin_pass.save if AdminPass.all.present?
  end

  def edit; end
  def update
    if @admin_pass.update(admin_pass_params)
      redirect_to admin_pass_path, notice: t('notice.updated')
    else
      render :edit
    end
  end
  private

  def admin_pass_params
    params.require(:admin_pass).permit(:password, :password_confirmation)
  end
end
