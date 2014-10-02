running = true
print 'Enter a command: '

while running == true
  input = gets.chomp

  case input
  when 'quit'
    running = false
  else
    puts "You entered #{input}"
    print 'Please enter another command: '
  end
end

puts 'Bye!'
