module SignInModule
  def sign_in(admin_pass)
    visit hospitals_path
    page.execute_script("document.querySelectorAll('.fade').forEach(element => element.classList.remove('fade'));")
    click_on '★'
    fill_in :session_password, with: admin_pass.password
    click_button '送信'
  end
end
