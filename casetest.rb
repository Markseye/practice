print "Enter Greeting : "
greeting = gets.chomp

case greeting
when "French", "french"
	puts "Bonjour"
	exit
when "Spanish", "spanish"
	puts "Hola"
	exit
else
	puts "Hello"
end