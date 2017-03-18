def word_position(word)
  letter_order = word.split("").sort.uniq
  duplicates = {}

  letter_order.each do |char|
    duplicates[char] = word.count(char)
  end

  min_position = 1
  max_position = factorial(word.length)

  max_position /= less_factorial(duplicates)
  length_left = word.length
  section_size = max_position

  possibilities = factorial(length_left)/less_factorial(duplicates)
  puts possibilities

  # atat should return 2

  word.each_char do |char|
    section = letter_order.index(char) + 1
    duplicates[char] -= 1

    if duplicates[char] == 0
        letter_order -= [char]
    end

    # ttaa = 6
    # min = 4

    possibilities = factorial(length_left - 1)/less_factorial(duplicates)
    puts possibilities

    min_position += (section_size / length_left) * (section - 1)
    max_position = (min_position - 1) + possibilities 

    # min = 1, max = 3, length_left
    #division_factor = length_left / how_many_duplicates(duplicates)

    #min_position += (section_size / division_factor) * (section - 1)
    #max_position = (min_position - 1) + section_size / division_factor

    puts "#{min_position}, #{max_position}"

    if max_position == min_position
      return min_position
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

def how_many_duplicates(someHash)
  dupes = 1
  someHash.each do |char, count|
    if count > 1
      dupes += (count - 1)
    end
  end
  dupes
end

puts "babc: #{word_position('babc')}" # 4
puts "atat: #{word_position('atat')}" # 2
puts "aatt: #{word_position('aatt')}" # 1
puts "ttaa: #{word_position('ttaa')}" # 6
puts "zzcba: #{word_position('zzcba')}" # 60
puts "zyxwv: #{word_position('zyxwv')}" # 120
puts "zzbba: #{word_position('zzbba')}" # 30
puts "zzzba: #{word_position('zzzba')}" # 20
puts "zbzaz: #{word_position('zbzaz')}" # 13
puts "zzzzcba #{word_position('zzzzcba')}" # 210