require 'rails_helper'

RSpec.describe 'AdminPass', type: :system do
  let!(:admin_pass) { FactoryBot.create(:admin_pass) }

  describe 'hospital_label' do
    subject { page }
    before do
      sign_in admin_pass
      visit admin_pass_path(admin_pass)
      click_link '診療科一覧'
    end
    describe 'new' do
      before do
        click_on '新規診療科'
      end
      context 'Failure' do
        example 'no name' do
          fill_in '名前:', with: ''
          click_on '登録'
          is_expected.to have_content '名前を入力してください'
        end
      end
      context 'success' do
        example 'name ok' do
          fill_in '名前:', with: 'テスト科'
          click_on '登録'
          is_expected.to have_content '新規登録しました！'
        end
      end
    end
    describe 'edit' do
      before do
        click_on '編集', match: :first
      end
      it {
          fill_in '名前:', with: '変更名前科'
          click_on '更新'
          is_expected.to have_content '更新しました！'
      }
    end
  end
end
