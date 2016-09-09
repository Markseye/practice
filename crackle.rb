for i in 1..100 
  if i%5 == 0 && i%3 == 0
    puts "CracklePop"
  elsif i%5 == 0
    puts "Pop"
  elsif i%3 == 0
    puts "Crackle"
  else
  	puts i
  end
end