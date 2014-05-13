class Anagram
  attr_accessor :value, :value_downcase

  def initialize(value)
    @value = value
    @value_downcase = value.downcase
  end

  def match(array)
    array_downcase = make_downcase(array)
    answer = array_downcase.select { |word| self.letter_match(word) && self.value.length == word.length && self.letter_count(word) && word != self.value }
    make_answer_upcase(answer, array)
  end


  def letter_match(word)
    value_array = self.value_downcase.chars
    word_array = word.chars
    word_array2 = word_array.select { |letter| value_array.include?(letter)}
    if word_array == word_array2
      true
    else
      false
    end
  end

    def letter_count(word)
    value_array = self.value_downcase.chars
    word_array = word.chars
    letter_count_value = { }
    value_array.each { |letter|
      letter_count_value[letter] = self.value_downcase.count(letter) 
    }
    letter_count_word = { }
    word_array.each { |letter|
      letter_count_word[letter] = word.count(letter) 
    }
    if letter_count_value == letter_count_word
      true
    else
      false
    end 
  end

end

def make_downcase(array)
  array.collect { |word| word.downcase }
end

def make_answer_upcase(answer, array)
  array.select { |word| answer.include?(word.downcase) }
end


