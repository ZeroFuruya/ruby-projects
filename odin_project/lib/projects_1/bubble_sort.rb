# frozen_string_literal: true

def bubble_sort(array_input)
  array_length = array_input.length
  for i in 0...array_length do 
    for j in 0...(array_length - i - 1) do
      if array_input[j] > array_input[j + 1]
        array_input[j], array_input[j + 1] = array_input[j + 1], array_input[j]
      end
    end
  end
  array_input
end

array_input = [8, 7, 6, 5, 12, 251, 25, 6, 2, 12, 6, 7, 8]

p bubble_sort(array_input)