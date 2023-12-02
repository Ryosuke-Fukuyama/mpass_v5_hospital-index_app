class HospitalsController < ApplicationController
  skip_before_action :admin_required, only: %i[index]

  def index
    @q = Hospital.ransack(params[:q])
    @hospitals = @q ? @q.result : Hospital.all
    @hospitals = @hospitals.includes(:hospital_labels).order(name: :asc).page(params[:page]).per(10)
    @hospital_labels = HospitalLabel.all
  end

  def new
    @hospital = Hospital.new
  end
  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to hospitals_path, notice: t('notice.saved')
    else
      render :new
    end
  end

  def edit; end
  def update
    @hospital.hospital_labelings.delete_all unless params[:hospital][:hospital_label_ids]

    if @hospital.update(hospital_params)
      redirect_to hospital_path(@hospital), notice: t('notice.updated')
    else
      render :edit
    end
  end

  def destroy
    redirect_to hospitals_path, notice: t('notice.destroyed') if @hospital.destroy
  end

  private

  def hospital_params
    params.require(:hospital).permit(
      :id,
      :name,
      :access,
      :url,
      hospital_label_ids: []
    )
  end
end
