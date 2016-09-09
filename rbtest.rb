=begin
fred = Class.new do

	def ash
		puts "hi " + self.to_s
	end

	def ash2
		puts "bye " + self.to_s
	end
end

fred.new.ash
fred.new.ash2
=end
greeting = gets.chomp

case greeting
when “French”, “french”
	puts “Bonjour”
	exit
when “Spanish”, “spanish”
	puts “Hola”
	exit
else
	puts “Hello”
end

