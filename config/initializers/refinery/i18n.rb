# encoding: utf-8

Refinery::I18n.configure do |config|
  # config.enabled = true

  config.default_locale = "zh-CN"

  config.current_locale = "zh-CN"

  config.default_frontend_locale = "zh-CN"

  # config.frontend_locales = [:en]

  config.locales = {:en=>"English", :"zh-CN"=>"Simplified Chinese", :"zh-TW"=>"Traditional Chinese" }
end
