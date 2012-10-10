require 'net/http'
require 'rexml/document'

include REXML



def print_line(t, pad='-', len = 30)
	puts "#{t}".center(len,pad)
end


def indent(idt = 2)
	print " " * idt
end


def parse(src)
	p src
	xml = Element.new(src)
	parse_phonetic_symbol xml
	parse_dict_trans xml
	print_line "Web translation", '='
	parse_web_tans xml
end



def translate(word)
	unless word.nil? or word.empty?
		print_line "dict translation: #{word}", "="
		parse Net::HTTP.get("dict.youdao.com", "/fsearch?q=#{word}")   # The HTTP Get request will get a xml file
	end
end

class Element 
	def each_node(path, &block)
		Xpath.each(self, path, &block)
	end
	def first_node(path) 
		Xpath.first(self, path)
	end
end


def parse_phonetic_symbol(xml)
	xml.each_node('//phonetic-symbol') do |node|
		if node.text
			indent
			puts "[#{node.text}]".cyan
		end
	end
end

def parse_dict_trans(xml)
	xml.each_node('//translation/content') do |node|
		indent
		puts node.text
	end
end

def parse_web_tans(xml)
	xml.each_node('//youdao-web-dict/web-translation') do|node|
		print_line node.first_node('key/').text
		node.each_node('trans/value/') do|val|
			indent 
			puts val.text
		end
	end
end
translate "hello"
#translate(ARGV[0]) if __FILE__ == $0
