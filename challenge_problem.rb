def word_position(word)
  letter_order = word.split("").sort.uniq
  duplicates = {}

  letter_order.each do |char|
    duplicates[char] = word.count(char)
  end

  min_position = 1
  max_position = factorial(word.length)
  less_positions = 1

  duplicates.each do |char, count|
    if count > 1
      less_positions *= factorial(count)
    end
  end

  max_position /= less_positions
  divide_by = word.length
  section_size = max_position

  word.each_char do |char|
    section = letter_order.index(char) + 1
    duplicates[char] -= 1

    if duplicates[char] == 0
        letter_order -= [char]
    end

    # need to get max of 60
    # section = 4, divide_by = 5, section_size = 60
    min_position += section_size / divide_by * (section - 1)
    max_position = (min_position - 1) + ((section_size / divide_by) * (duplicates[char] + 1))

    if max_position == min_position
      return min_position
    else
      divide_by -= 1
      section_size = max_position - (min_position - 1)
    end
  end
end

def factorial(number)
  total = 1

  1.upto(number) do |num|
    total *= num
  end
  total
end

puts word_position("zabc")