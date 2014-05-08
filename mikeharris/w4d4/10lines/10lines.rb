 # print `clear`
 # (1..100).each {["\b\\","\b|", "\b/", "\b-",["\b\\","\b\\","\b\\","- ","* ","\n"].sample].each {|a| print a ; sleep(1.0/50)  }}

  require 'colorize'
  puts `clear` + "Enter your message:" 
  input = gets.chomp
  (30 - input.size).times{input <<  " "} 
  (1..100).each do |i|
    print input.colorize([:red,:yellow,:blue,:green,:orange].sample) ; sleep(1.0/20)
    (0..input.length).each {print "\b"}
     input = input[-1] + input[0...-1]
    end
