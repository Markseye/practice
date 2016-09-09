puts "Guess a number between 1 and 10"
ui= gets.to_i
rn= rand(9)+1 # to get 1-10

for i in 1..3
	if ui==rn
		puts "You guessed correctly"
		break
	elsif i<3
		puts"Guess Again"
		ng=gets.to_i
		if ng==rn
			puts "You guessed right!"
		else
			puts "You guessed wrong"
		end
	else 
		puts "Your third guess was incorrect. Sorry!"
		puts "The correct number was #{i}"
	end
end