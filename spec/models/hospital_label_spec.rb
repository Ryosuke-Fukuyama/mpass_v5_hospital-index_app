require 'rails_helper'

RSpec.describe HospitalLabel, type: :model do
  describe 'varidation' do
    let!(:hospital_label) { FactoryBot.create(:hospital_label) }
    context 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).case_insensitive }
    end
  end
end
