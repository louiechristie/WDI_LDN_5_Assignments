class Anagram

  def initialize(value)
    @value = value
  end

  def match(array)
    anagram_result = []
    array.each do |item|
      if check_letters?(item.downcase) && @value != item.downcase
        anagram_result << item
      end
    end
    anagram_result
  end

  def check_letters?(item)
    @value.downcase.chars.sort == item.chars.sort
  end
end