class HospitalLabelsController < ApplicationController
  def index
    @q = HospitalLabel.ransack(params[:q])
    @hospital_labels = @q ? @q.result : HospitalLabel.all
    @hospital_labels = @hospital_labels.order(name: :asc).page(params[:page]).per(20)

    @hospital_label = HospitalLabel.new
  end

  def create
    @hospital_label = HospitalLabel.create(hospital_label_params)
    @hospital_label.save
    # 表示箇所がレンダリング範囲外の為ページ遷移後に表示されてしまう。
    # ? flash[:notice] = t('notice.saved') : flash[:alert] = t('alert.false')

    @hospital_labels = HospitalLabel.all.order(name: :asc).page(params[:page]).per(20)
  end

  private
  def hospital_label_params
    params.require(:hospital_label).permit(:name)
  end
end
