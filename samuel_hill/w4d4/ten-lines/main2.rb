puts "**** Are you bored? I can help find you things to do! ***"
puts "What city are you currently in?"
city = gets.chomp
`open http://www.timeout.com/#{city}`
`open http://www.lonelyplanet.com/searchResult?q=#{city}`
`open http://www.roughguides.com/?s=#{city}&x=-1253&y=-56`
`open https://www.google.co.uk/#q=#{city}+points+of+interest`

