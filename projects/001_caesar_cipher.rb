def caesar_cipher(text, steps)
  a = ("a".."z").to_a
  b = ("A".."Z").to_a
  code_word = ""

  text.each_char do |char|
    if a.include?(char)
      index = a.find_index(char) + steps
      if index == 26
        code_word << a[0]
      else
        index -= a.length
        code_word << a[index]
      end

    elsif b.include?(char)
      index = b.find_index(char) + steps
      if index == 26
        code_word << b[0]
      else
        index -= b.length
        code_word << b[index]
      end

    else
      code_word << char
    end
  end

  puts code_word
end

caesar_cipher("What a string!", 5)
caesar_cipher("Testing rounds: v - V or u - U!", 5)

puts "Write your message to encrypt:"
text = gets.chomp
puts "Write your code factor:"
steps = gets.chomp.to_i

caesar_cipher(text, steps)