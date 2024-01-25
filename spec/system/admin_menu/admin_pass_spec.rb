require 'rails_helper'

RSpec.describe 'AdminPass', js: true, type: :system do
  let!(:admin_pass) { FactoryBot.create(:admin_pass) }

  describe 'session' do
    subject { page }
    describe 'modal sign_in' do
      before do
        visit hospitals_path
      end
      context 'Failure' do
        example 'no password' do
          page.execute_script("document.querySelectorAll('.fade').forEach(element => element.classList.remove('fade'));")
          click_on '★'
          fill_in :session_password, with: ''
          click_button '送信'
          is_expected.not_to have_content 'ログインしました'
        end
      end
    end
    xdescribe 'sign_out' do
      before do
        sign_in admin_pass
      end
      it {
        page.execute_script("document.querySelectorAll('.fade').forEach(element => element.classList.remove('fade'));")
        click_on '管理メニュー'
        click_link 'ログアウト'
        is_expected.to have_content 'ログアウトしました'
        is_expected.not_to have_content '管理メニュー'
      }
    end
  end

  xdescribe 'edit' do
    subject { page }
    before do
      sign_in admin_pass
      visit hospitals_path
      page.execute_script("document.querySelectorAll('.fade').forEach(element => element.classList.remove('fade'));")
      click_button '管理メニュー'
      click_link '管理パス変更'
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
        is_expected.to have_content "変更しました。"
      end
    end
  end
end