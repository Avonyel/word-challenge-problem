def word_position(word)
  letter_order = word.split("").sort.uniq
  duplicates = {}

  letter_order.each do |char|
    duplicates[char] = word.count(char)
  end

  min_position = 1
  max_position = factorial(word.length) / less_factorial(duplicates)
  length_left = word.length
  section_size = max_position

  possibilities = max_position

  # atat should return 2

  word.each_char do |char|
    section = which_section(duplicates, char)

    duplicates[char] -= 1

    # zzbba = 30
    # min = 19

    possibilities = factorial(length_left - 1)/less_factorial(duplicates)

    if duplicates[char] == 0
      letter_order -= [char]
    end


    min_position += section_size / length_left.to_f * (section)
    max_position = (min_position - 1) + possibilities 

    # puts "#{min_position}, #{max_position}"

    if max_position == min_position
      return min_position.to_i
    else
      length_left -= 1
      section_size = possibilities
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

def less_factorial(someHash)
  total = 1
  someHash.each do |char, count|
    if count > 1
      total *= factorial(count)
    end
  end
  total
end

def which_section(someHash, character)
  sum = 0
  someHash.each do |char, count|
    if character == char
      return sum
    end
    sum += count
  end
end

unless ARGV[0]
  puts "Please supply a word from the command line."
  exit
end

word = ARGV[0].upcase

if word.scan(/[^A-Z]/).empty?
  puts word_position(word)
else
  puts "Please use only letters, with no spaces, numbers, or special characters."
end

