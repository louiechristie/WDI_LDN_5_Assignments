require 'pry'

class Anagram
  def initialize(word)
    @word = Word.new(word)
  end

  def match(words)
      words.select do |w| 
        @word.anagram_of?(w) 
        if w == @word
        return []
        else
        return w
      end
  end
  binding.pry
end

class Word < String
  def anagram_of?(word)
    letters(self.downcase) == letters(word.downcase)
  end

  private

  def letters(word)
    word.chars.sort
  end
end





