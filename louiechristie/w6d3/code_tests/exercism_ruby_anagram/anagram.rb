#Write a program that, given a word and a list of possible anagrams, selects the correct sublist.


class Anagram

  @word = String.new

  def initialize(value)
    @word = value
    puts
    puts ("value: "+value)
    puts ("word: "+@word)


  end

  def match(array)
    anagrams = []
    puts
    puts ("array: "+array.inspect)
    puts ("word: "+@word)
    #take word and generate every anagram of it and put in an array called anagrams
    
    @word.chars.permutation.map(&:join).uniq.each do |anagram|
      if anagram == @word 
      
      else 
        anagrams << anagram
      
      end
    end
  
    puts ("anagrams: "+anagrams.inspect)
  
    #Take any value in both anagrams and array and put in new array matches.
    downcase_anagrams = anagrams.map!{|c| c.downcase}
    downcase_array = array.map!{|c| c.downcase}

    matches_downcase = downcase_anagrams & downcase_array

    array.each do |word|
      word << matches if array.include?(word.downcase)
    end

    return matches

  end
  
end