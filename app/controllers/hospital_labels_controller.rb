class HospitalLabelsController < ApplicationController
  def index
    @hospital_labels = HospitalLabel.all.order(name: :asc)
  end

  def create
    @hospital_label = HospitalLabel.create(hospital_label_params)
    @hospital_label.save ? flash[:notice] = t('notice.saved') : flash[:alert] = t('alert.false')
  end

  private
  def hospital_label_params
    params.require(:hospital_label).permit(:name)
  end
end
