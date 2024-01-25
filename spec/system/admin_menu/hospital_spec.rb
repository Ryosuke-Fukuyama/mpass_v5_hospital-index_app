require 'rails_helper'

RSpec.describe 'AdminPass', type: :system do
  let!(:admin_pass) { FactoryBot.create(:admin_pass) }
  let!(:hospital_label_1) { FactoryBot.create(:hospital_label, id: 1) }
  let!(:hospital_label_2) { FactoryBot.create(:second_hospital_label, id: 2) }
  let!(:hospital) { FactoryBot.create(:hospital, hospital_label_ids: [1]) }
  before do
    sign_in(admin_pass)
  end

  describe 'new hospital' do
    subject { page }
    before do
      page.execute_script("document.querySelectorAll('.fade').forEach(element => element.classList.remove('fade'));")
      click_on '管理メニュー'
      click_link '新規病院'
    end
    context 'Failure' do
      example 'no name' do
        fill_in '病院名',   with: ''
        fill_in 'アクセス', with: 'サンプル駅バス20分'
        fill_in 'URL',     with: 'https://www.???'
        # fill_in '住所',     with: 'テスト県サンプル市123'
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
        # fill_in '住所',     with: 'テスト県サンプル市123'
        check 'hospital_hospital_label_ids_1'
        click_on '登録'
        is_expected.to  have_content '新規登録しました！'
      end
    end
  end

  describe 'edit hospital' do
    subject { page }
      context 'updated' do
        first('.edit-btn').click_link
        fill_in '病院名',   with: '更新病院'
        fill_in 'アクセス', with: 'サンプル駅バス20分'
        fill_in 'URL',     with: 'https://www.???'
        # fill_in '住所',     with: 'テスト県サンプル市123'
        check 'hospital_hospital_label_ids_1'
        click_on '更新'
        is_expected.to  have_content '更新しました！'
        is_expected.to  have_content '更新病院'
      end
      context 'delet' do
        first('.edit-btn').click_link
        page.accept_confirm("削除しますか？") do
          click_on '削除'
        end
        is_expected.to have_content "削除しました"
        is_expected.not_to  have_content '第一病院'
      end
    end
  end
end
