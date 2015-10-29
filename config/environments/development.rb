Rails.application.configure do
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		address: "smtp.exmail.qq.com",
#		address: "smtp.mxhichina.com",
		port: 25,
		domain: "exmail.qq.com",
		#domain: "qiye.aliyun.com",
		authentication: :login,
		user_name: "george@lieleme.com",
		#user_name: "george.qiao@lieleme.com",
		password: "Lieleme1"
		#password: "Qwer1234"
	}
  
  # Settings specified here will take precedence over those in config/application.rb.
  
  I18n.enforce_available_locales = false

  # 让peperclip知道到哪里找ImageMagick
  Paperclip.options[:command_path] = "/usr/local/bin/"

  # devise中confrim_url要用到
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.action_controller.perform_caching = true
  config.cache_store = :file_store, "#{Rails.root}/public/caches/"
  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
