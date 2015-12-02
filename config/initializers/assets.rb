# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( adapter.js )
Rails.application.config.assets.precompile += %w( ieMediaStream.js )
Rails.application.config.assets.precompile += %w( woogeen.sdk.js )
Rails.application.config.assets.precompile += %w( woogeen.sdk.ui.js )
Rails.application.config.assets.precompile += %w( script2.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
