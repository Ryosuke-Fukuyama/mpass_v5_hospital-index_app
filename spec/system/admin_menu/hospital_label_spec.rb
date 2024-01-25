require 'rails_helper'

RSpec.describe 'AdminPass', type: :system do
  let!(:admin_pass) { FactoryBot.create(:admin_pass) }

  describe 'hospital_label' do
    subject { page }
    before do
      sign_in(admin_pass)
      page.execute_script("document.querySelectorAll('.fade').forEach(element => element.classList.remove('fade'));")
      click_on '管理メニュー'
      click_link '診療科一覧'
    end
    describe 'new' do
      context 'Failure' do
        example 'no name' do
          fill_in 'new_label_textfield', with: ''
          page.accept_confirm("で宜しいですか？") do
            click_on '登録'
          end
          is_expected.to have_content '名前を入力してください'
        end
      end
      context 'success' do
        example 'name ok' do
          fill_in 'new_label_textfield', with: 'テスト科'
          page.accept_confirm("で宜しいですか？") do
            click_on '登録'
          end
          is_expected.to have_content '新規登録しました！'
        end
      end
    end
  end
end
