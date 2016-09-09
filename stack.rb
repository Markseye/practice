require_relative "stacklike"
class Stack
	attr_reader stack
	def initialize
		@stack =[]
	end

	def add_to_stack(obj)
		stack.push(obj)
	end

	def take_from_stack
		stack.pop
	end
end

s= Stack.new
s.add_to_stack("line1")
s.add_to_stack("line2")
puts s.stack
taken = s.take_from_stack
puts taken
puts "new stack :" 
puts s.stack