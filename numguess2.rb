puts "Let's play a game! Guess a number between 1 and 10."
ui = gets.chomp.to_i
rn = rand(1 .. 10) # to get 1-10
i = 1

while i < 3 and ui != rn
	message = if ui < rn
		"Guess Higher!"
	else
		"Guess Lower!"
	end
	puts "You guessed incorrectly. #{message}"
	ui = gets.chomp.to_i
	i += 1
end

if ui == rn
	puts "The number was #{rn}. You guessed correctly."
else
	puts "The number was #{rn}. Your three guesses were incorrect. Sorry!"
end