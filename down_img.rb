#!/usr/bin/env ruby
# encoding: utf-8
#========================================================================
#   FileName: down_img.rb
#     Author: Linxiangyu
#      Email: lxyweb@gmail.com
#   HomePage: http://www.linxiangyu.info
# LastChange: 2012-09-26 18:07:46
#========================================================================


require 'nokogiri'
require 'open-uri'

def download_file(file_name, url)
begin
	puts "     Downlanding #{file_name}"
	date = open(url).read
	file = File.new file_name, 'w'
	file << date
	file.flush
	file.close
rescue => e
	puts "Hello, I'm a error: #{e}"
end
end

def parse(url)
begin
	puts "Now parse #{url}" 
	doc = Nokogiri::HTML(open(url))
	num = 0;
	doc.css('img').each do |img|
		img_link = img.attributes['src']
		if File.extname(img_link).nil?
			next
		end
		name = Time.now.to_f.to_s + File.extname(img_link)
		download_file(name, img_link)
	end
rescue => e
	puts "Hello, I'm a error: #{e}"
end
end

def search(start)

	url_root = start.slice(%r{.*com})
	puts "root is : #{url_root}"
	
	queue = Array.new
	queue[0] = start
	flag = Hash.new(nil)
	flag[start] = true
	flag[nil] = true
	while !queue.empty? do
		begin
		url = queue.pop
		puts "Prase URL: #{url}"
		doc = Nokogiri::HTML(open(url))
		doc.css('a').each do |link|
			new_link = url_root + link.attributes['href'] if link.attributes['href'] != nil
			if !flag[new_link] 
				puts "New Link:#{new_link} "
				flag[new_link] = true
				queue.push(new_link)
				parse(new_link)
			end
		end
		rescue => e
			puts "Hello, I'm a error: #{e}"
		end
	end

end

	



#=========================MAIN=========================
search("")
