# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
puts "没有导入Micropost"
require File.expand_path('../clear_all', __FILE__)
# 从github爬IT工程师的邮箱
# require File.expand_path('../test', __FILE__)
require File.expand_path('../hr',__FILE__)
require File.expand_path('../users',__FILE__)
require File.expand_path('../hunters',__FILE__)
require File.expand_path('../jobs',__FILE__)
require File.expand_path('../line_items',__FILE__)
require File.expand_path('../reviews',__FILE__)
require File.expand_path('../invitations',__FILE__)
require File.expand_path('../interviews',__FILE__)
#require File.expand_path('../microposts',__FILE__)
require File.expand_path('../saving_lists',__FILE__)
require File.expand_path('../talent_pools',__FILE__)

