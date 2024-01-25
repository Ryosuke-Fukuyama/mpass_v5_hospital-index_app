require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  url = 'http://chromium:4444/wd/hub'
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      # binary: '/path/to/chromium',
      args: [
        '--headless',
        '--window-size=1400,1400',
        '--no-sandbox',
        '--disable-dev-shm-usage',
        '--lang=ja-JP',
      ],
    }
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: url,
    capabilities: capabilities,
  )
end

# Capybara.javascript_driver = :selenium_headless

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true, driver: :selenium) do
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 4444
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
    # driven_by :remote_chrome
  end
end