# frozen_string_literal: true

def substrings(words, dictionary)
  splitted_words = words.downcase.split(/[^a-zA-Z0-9']/).reject(&:empty?)
  valid_string_count = dictionary.each_with_object(Hash.new(0)) do |dictionary_word, hash|
    hash[dictionary_word] += splitted_words.reduce(0) { |acc, word| word =~ /#{dictionary_word}/ ? acc + 1 : acc }
    hash.delete(dictionary_word) if hash[dictionary_word].zero?
  end
  puts valid_string_count
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

substrings("Howdy partner, sit down! How's it going?", dictionary)
