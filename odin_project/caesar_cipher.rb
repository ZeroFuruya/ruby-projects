# frozen_string_literal: true

# Documentation: Used Claude AI to generate documentation

# Implementation of the Caesar cipher encryption algorithm
#
# The Caesar cipher is a substitution cipher where each letter in the plaintext
# is shifted a certain number of places down or up the alphabet.
#
# @param str_in [String] The input string to be encrypted
# @param shift_num [Integer] The number of positions to shift each character
#
# @return [String] The encrypted string with each alphabetic character shifted by shift_num positions
#                  Non-alphabetic characters remain unchanged
#
# @example
#   caesar_cipher("Hello, World!", 3) # => "Khoor, Zruog!"
#   caesar_cipher("abc", 1) # => "bcd"
#   caesar_cipher("xyz", 3) # => "abc"

def caesar_cipher(str_in, shift_num)
  return str_in if shift_num.zero? || str_in.empty?

  shift_num %= 26

  ciphered_str = []
  str_in.each_char do |chr|
    if chr.match?(/[A-Za-z]/)
      alpha_ord = first_last_ord(chr)
      shft_eq = ((chr.ord + shift_num) % alpha_ord[:last]).zero? ? alpha_ord[:last] : ((chr.ord + shift_num) % alpha_ord[:last])
      ciphered_str << (shft_eq + (shft_eq >= alpha_ord[:first] ? 0 : alpha_ord[:first] - 1)).chr
    else
      ciphered_str << chr
    end
  end
  ciphered_str.join('')
end

# Rubucop is complaining lmfao "Method has too many lines. [12/10] (convention:Metrics/MethodLength)"
# Rubucop is telling me that the conventions for method is, the line count should never exceed 10 lines
# I'm going to refractor it by extracting logics that I can reuse

# line below will either return small values that will need to be wrapped (+64) or values greater than first_ord_val
# shft_eq = ((chr.ord + shift_num) % alphabet_ord[:last])
# wrap_num = shft_eq > alphabet_ord[:first] ? 0 : 64 # sample, 70 > 65 is true, so no need to wrap, hence 0
# I will have to reduce these lines, but I'm keeping them as a comment for good practice. I might come back to this code
# or other people might look at it, so I'm gonna keep the verbose syntax

# Determines if a character is uppercase
#
# @param chr [String] A single character to check
# @return [Boolean] true if the character is uppercase, false otherwise
def upcase?(chr)
  chr == chr.upcase
end

# Gets the Unicode code points for the first and last letters of the alphabet 
# in the same case as the input character
#
# @param chr [String] A single character whose case will determine the alphabet range
# @return [Hash] A hash containing :first and :last keys with corresponding Unicode values
#                for 'A'/'a' and 'Z'/'z' depending on the case of the input character
def first_last_ord(chr)
  first_alphabet = upcase?(chr) ? 'A'.ord : 'a'.ord
  last_alphabet = upcase?(chr)  ? 'Z'.ord : 'z'.ord

  { first: first_alphabet, last: last_alphabet }
end

puts caesar_cipher("What a string!", 5)


time = Benchmark.measure do
  stock_picker(stock_prices)
end

puts time


# Optional: User Input
# print 'Enter a string to cipher: '
# str_in = gets.chomp
# print 'Enter a number to shift: '
# shift_num = gets.chomp

# puts caesar_cipher(str_in, shift_num.to_i)

# debugging
# 1.downto(-104) do |i|
#   puts "Shift Number #{i}: #{caesar_cipher('a', i)}"
# end