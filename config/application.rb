require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Bundler.require(*Rails.groups(assets: %w(development test production)))
# module Site20
  module Lieyohui
  class Application < Rails::Application
    # config.active_job.queue_adapter = :resque
    config.active_record.raise_in_transactional_callbacks = true
    
    # Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # fall back to the default language if translation not found
    config.i18n.fallbacks = [:en]
    # config.serve_static_assets = true
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
	      html_tag
    }
    # devise setting
    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = [:cn]
    config.i18n.default_locale = "cn"
    config.assets.initialize_on_precompile = true
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
