#!/usr/bin/env ruby
# encoding: utf-8
#========================================================================
#   FileName: down_qiushibaike.rb
#     Author: Linxiangyu
#      Email: lxyweb@gmail.com
#   HomePage: http://www.linxiangyu.info
# LastChange: 2012-09-27 18:10:42
#========================================================================

require 'nokogiri'
require 'open-uri'


url = 'http://www.qiushibaike.com/8hr'


doc = Nokogiri::HTML(open(url))

doc.css("div").each do |post|
	if post['class'] ==  "main" 
		puts "Start"
		post.css('div div div div').each do |content|
			if content['class'] == 'content'
				puts content.content
			end
		end
	end
end
