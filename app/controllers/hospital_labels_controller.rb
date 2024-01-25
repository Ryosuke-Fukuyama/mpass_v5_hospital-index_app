class HospitalLabelsController < ApplicationController
  def index
    @q = HospitalLabel.ransack(params[:q])
    @hospital_labels = @q ? @q.result : HospitalLabel.all
    @hospital_labels = @hospital_labels.order(name: :asc).page(params[:page]).per(20)

    @hospital_label = HospitalLabel.new
  end

  def create
    @hospital_label = HospitalLabel.create(hospital_label_params)
    flash[:notice] =''
    flash[:alert] = ''
    @hospital_label.save ? flash[:notice] = t('notice.saved') : flash[:alert] = t('alert.false')

    @hospital_labels = HospitalLabel.all.order(name: :asc).page(params[:page]).per(20)
  end

  private
  def hospital_label_params
    params.require(:hospital_label).permit(:name)
  end
end
