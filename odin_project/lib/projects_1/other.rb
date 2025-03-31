def substrings(word, dictionary)
  result = {}
  lowercase_word = word.downcase
  
  dictionary.each do |substring|
    count = lowercase_word.scan(substring.downcase).length
    if count > 0
      result[substring] = count
    end
  end
  
  return result
end
dictionary =["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts "Test 1:"
p substrings("Howdy partner, sit down! How's it going?", dictionary)