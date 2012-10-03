#!/usr/bin/env ruby
# encoding: utf-8
#========================================================================
#   FileName: temp.rb
#     Author: Linxiangyu
#      Email: lxyweb@gmail.com
#   HomePage: http://www.linxiangyu.info
# LastChange: 2012-09-25 22:47:58
#========================================================================

## To Counter this Dir's all file's line num

exname = "rb"


def counter(filename)
	file = open(filename)
	line = 0
	while text = file.gets do
		line = line + 1
	end
	puts "#{filename} has #{line} lines"
	line
end

line_num = 0

Dir.glob("*." + exname).each do |file|
	if FileTest.file?(file)
		line_num += counter(file)
	end
end

puts "=========================================="
puts "Total Line Num: #{line_num}"
puts "=========================================="


