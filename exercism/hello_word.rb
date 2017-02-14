require 'minitest/pride'

def hello_word( name )
	if nil != name then
		puts "Hello, #{ name }!"
	else
		puts "Hello, World!"
	end
end