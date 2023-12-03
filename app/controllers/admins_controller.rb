class AdminsController < ApplicationController
  skip_before_action :admin_required, only: %i[create]

  # def new
  #   @admin = Admin.new
  # end
  def create
    @admin = Admin.new(admin_params)
    @admin.save if Admin.all.present?
  end

  def edit; end
  def update
    if @admin.update(admin_params)
      redirect_to admin_path, notice: t('notice.updated')
    else
      render :edit
    end
  end
  private

  def admin_params
    params.require(:admin).permit(:password, :password_confirmation)
  end
end
