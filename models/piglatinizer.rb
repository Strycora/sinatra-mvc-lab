class PigLatinizer
  attr_reader :text

  def piglatinize(text)
    text.split(" ").map{ |word| word_to_piglatin(word)}.join(" ")
  end

  private

  def vowel?(char)
    char.match(/[aAeEiIoOuU]/)
  end

  def word_to_piglatin(word)
    if vowel?(word[0])
      word + "way"
    else
      vowel_index = word.index(/[aAeEiIoOuU]/)
      consonants = word.slice(0..vowel_index-1)
      word_ending = word.slice(vowel_index..word.length)
      word_ending + consonants + "ay"
    end
  end
end