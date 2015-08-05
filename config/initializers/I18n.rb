# 这个文件目的有二:1.设置默认locale 2.设置语言option, 即:locale参数的list
#encoding: utf-8
I18n.default_locale = :zh
I18n.backend.class.send(:include, I18n::Backend::Fallbacks)
#I18n.fallbacks.map('cn' => 'en')
LANGUAGES = [
	['English', 'en'],
	["中文".html_safe, 'cn'] #html_safe告诉rails这是html语言，需要把markup语言转译成html
]
