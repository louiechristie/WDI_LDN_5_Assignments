class PigLatin

  def initialize

  end

  def self.translate(phrase)
    words = phrase.split(" ")
    return_phrase = []
    words.each do |word|
      return_phrase << translate_word(word)
    end
    return_phrase.join(" ") 
  end

  def self.translate_word(word)
    bum_chars = ['a','e','i','o','u']
    two_chars = ['ch','th','qu']
    if bum_chars.include?(word[0])
        word << "ay"
    else
      if word[0..2] == "thr" || word[0..2] == "sch"
        first_letter = word[0..2]
        word[0..2] = ""
      elsif two_chars.include?(word[0..1]) 
        first_letter = word[0..1]    
        word[0..1] = ""
      elsif word[1..2] == "qu"
        first_letter = word[0..2]
        word[0..2] = ""
      else    
        first_letter = word[0]    
        word[0] = ""
      end
      word << first_letter <<"ay"
    end
  end











end