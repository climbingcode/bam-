require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Bam
  class Application < Rails::Application

    # mailer config for host email
    config.action_mailer.default_url_options = { host: 'tom_doido@hotmail.com' }
    # pdf config for pdf generation
    # Mime::Type.register "application/pdf", :pdf 

    # Filepreviews.configure do |config|
    # config.api_key = 'rSvOfDC8FD6rWCKV8dYgcApP6gbUlU'
    # end
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
