

input = File.new("input.txt", "r")
output = File.new("output.txt", "w" )

while (line = input.gets)
    puts line
    output << line
end

input.close
output.close
