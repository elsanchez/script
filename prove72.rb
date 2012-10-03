#!/usr/bin/env ruby
# encoding: utf-8
#========================================================================
#   FileName: prove72.rb
#     Author: Linxiangyu
#      Email: lxyweb@gmail.com
#   HomePage: http://www.linxiangyu.info
# LastChange: 2012-09-01 23:41:15
#========================================================================



puts "This is a problem to prove the 72 law "
puts "Author: Linxiangyu Email:lxyweb@gmail.com"
puts
puts "Rate\texpect\tcalc"
puts

for i in 1..50

	year_expect = 72 / i

	rate = i / 100.0
	start = 1
	for year in 1..100 
		start = start * (1 + rate)
		if start >= 2 
			year_calc = year
			break
		end
	end
	
	printf("%0.2f\t%d\t%d\n",rate, year_expect, year_calc)
end
