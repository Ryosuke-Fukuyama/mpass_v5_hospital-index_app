require 'rails_helper'

RSpec.describe 'AdminPass', type: :system do
  let!(:admin_pass) { FactoryBot.create(:admin_pass) }

  describe 'session' do
    subject { page }
    describe 'sign_in' do
      before do
        visit new_admin_pass_session_path
      end
      context 'Failure' do
        example 'no password' do
          fill_in :admin_pass_password, with: ''
          click_button 'ログイン'
          is_expected.to have_content 'お名前、Emailまたはパスワードが違います。'
        end
      end
    end
    describe 'sign_out' do
      before do
        sign_in admin_pass
        visit admin_pass_path(admin_pass)
      end
      it {
        click_link 'ログアウト'
        is_expected.to have_content 'ログアウトしました'
        is_expected.not_to have_content '管理メニュー'
      }
    end
  end

  describe 'edit' do
    subject { page }
    before do
      sign_in admin_pass
      visit admin_pass_path(admin_pass)
      click_link 'アカウント編集'
    end
    context 'Failure' do
      example 'no current_password' do
        fill_in 'パスワード',         with: "newPass-W0rd"
        fill_in 'パスワード（確認用）', with: "newPass-W0rd"
        fill_in '現在のパスワード',    with: ""
        click_on "更新"
        is_expected.to have_content "現在のパスワードを入力してください"
      end
    end
    context 'success' do
      example 'ok current_password' do
        fill_in 'パスワード',         with: "newPass-W0rd"
        fill_in 'パスワード（確認用）', with: "newPass-W0rd"
        fill_in '現在のパスワード',    with: admin_pass.password
        click_on "更新"
        is_expected.to have_content "アカウント情報を変更しました。"
      end
    end
  end
end