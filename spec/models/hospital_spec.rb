require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'varidation' do
    let!(:hospital) { FactoryBot.create(:hospital) }

    context 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(99) }
    end

    context 'access' do
      it { is_expected.to validate_length_of(:access).is_at_most(99) }
    end

    context 'url' do
      it { is_expected.to validate_length_of(:url).is_at_most(99) }
    end

    # # 未実装箇所
    # context 'address' do
    #   it { is_expected.to validate_presence_of(:address) }
    #   it { is_expected.to validate_length_of(:address).is_at_most(255) }
    # end

    # context 'map after_validation' do
    #   let!(:hospital_2) { FactoryBot.create(:second_hospital, address: '兵庫県神戸市中央区加納町１丁目３−１') }

    #   it 'is valid when appropreate latlng is received with an address' do
    #     Hospital.geocoded_by :address
    #     lat = hospital_2.latitude.to_f
    #     lng = hospital_2.longitude.to_f
    #     expect(lat).to be_within(0.005).of 34.706705
    #     expect(lng).to be_within(0.005).of 135.195490
    #   end
    # end
  end
end
