require 'rails_helper'

RSpec.describe AdminPass, type: :model do
  describe 'varidation' do
    let!(:admin_pass) { FactoryBot.create(:admin_pass) }
    context 'password' do
      it { is_expected.to validate_presence_of(:password).on(:create) }

      it '正規表現' do
        admin_pass.password = 'password1234'
        admin_pass.password_confirmation = 'password1234'
        is_expected.to be_invalid
      end
    end
  end
end
