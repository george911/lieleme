# config/initializers/pusher.rb
require 'pusher'

Pusher.url = "https://0c91c038ba28a918d3f3:5af0a0b5f6c3fde24d5a@api.pusherapp.com/apps/159039"
Pusher.logger = Rails.logger


Pusher.app_id = '159039'
Pusher.key = '0c91c038ba28a918d3f3'
Pusher.secret = '5af0a0b5f6c3fde24d5a'  
