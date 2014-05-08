class Anagram

  def initialize(value)
    @value = value
  end

  def match(array)
    []
    output_array = []
    
    array.each do |word|
        if word.downcase.chars.sort == @value.downcase.chars.sort && @value != word.downcase
          output_array.push(word)
        end
    end
    return output_array.uniq
  end
end



# class Anagram
#   def initialize(word)
#     @word = Word.new(word)
#   end

#   def match(words)
#     words.select { |w| @word.anagram_of?(w) }
#   end
# end

# class Word < String
#   def anagram_of?(word)
#     letters(self.downcase) == letters(word.downcase)
#   end

#   private

#   def letters(word)
#     word.chars.sort
#   end
# end





  


