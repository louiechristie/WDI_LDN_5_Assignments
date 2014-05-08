class PigLatin

  @vowels = ['a', 'e', 'i', 'o', 'u']
  
  def self.translate(word)
    if vowel_word?(word)
      vowel_word_translate(word)
    else
      consonate_word_translate
    end
  end

  def self.vowel_word?(word)
    @vowels.include?(word[0])
  end

  def self.vowel_word_translate(word)
    word + "ay"
  end

  def consonate_word_translate(word)
    word.push(word.shift)
  end

end

