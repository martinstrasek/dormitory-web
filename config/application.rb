require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module DormitoryWeb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    social_keys = File.join(Rails.root, 'config', 'social_keys.yml')
    if File.exists?(social_keys)
        CONFIG = HashWithIndifferentAccess.new(YAML::load(IO.read(social_keys)))[Rails.env]
        CONFIG.each do |k,v|
      ENV[k.upcase] ||= v
    end
    else
        IO.write social_keys, <<-eos
development:
  facebook_key: "Enter your keys here. Check Read me file to know how to get keys"
  facebook_secret: "Enter your keys here. Check Read me file to know how to get keys"

  vkontakte_key: "Enter your keys here. Check Read me file to know how to get keys"
  vkontakte_secret: "Enter your keys here. Check Read me file to know how to get keys"

production:
  facebook_key: "Enter your keys here. Check Read me file to know how to get keys"
  facebook_secret: "Enter your keys here. Check Read me file to know how to get keys"

  vkontakte_key: "Enter your keys here. Check Read me file to know how to get keys"
  vkontakte_secret: "Enter your keys here. Check Read me file to know how to get keys"

        eos
        p "enter api keys to config/social_keys.yml"
    end
  end
end
