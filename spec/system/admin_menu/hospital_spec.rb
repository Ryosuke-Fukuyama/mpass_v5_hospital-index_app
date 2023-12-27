require 'rails_helper'

RSpec.describe 'AdminPass', type: :system do
  let!(:admin_pass) { FactoryBot.create(:admin_pass) }

  describe 'new hospital' do
    subject { page }
    before do
      sign_in admin_pass
      visit admin_pass_path(admin_pass)
      click_link '新規病院'
    end
    context 'Failure' do
      example 'no name' do
        fill_in '病院名',   with: ''
        fill_in 'アクセス', with: 'サンプル駅バス20分'
        fill_in 'URL',     with: 'https://www.???'
        fill_in '住所',     with: 'テスト県サンプル市123'
        check 'hospital_hospital_label_ids_1'
        click_on '登録'
        is_expected.to  have_content '病院名を入力してください'
      end
    end
    context 'success' do
      example 'full_in all' do
        fill_in '病院名',   with: 'テスト病院'
        fill_in 'アクセス', with: 'サンプル駅バス20分'
        fill_in 'URL',     with: 'https://www.???'
        fill_in '住所',     with: 'テスト県サンプル市123'
        check 'hospital_hospital_label_ids_1'
        click_on '登録'
        is_expected.to  have_content '新規登録しました！'
      end
    end
  end

  let!(:hospital_1) { FactoryBot.create(:hospital, hospital_label_ids: [1]) }

  describe 'saport admin' do
    subject { page }
    before do
      sign_in admin_pass
      visit hospitals_path
      first('tbody tr td').click_link
    end
    context 'have button' do
      it {
        is_expected.to have_content '編集'
        is_expected.to have_content '削除'
      }
    end
  end
end
