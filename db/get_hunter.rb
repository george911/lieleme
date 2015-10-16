require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'

agent = Mechanize.new
page = agent.get('http://www.liepin.com/user/login/?user_login=')
  f1 = page.forms.first
  f1.user_login = "13916382071@139.com"
  f1.user_pwd = "sy15906112"
page = agent.submit(f1)

pp page




