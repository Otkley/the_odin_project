def caesar_cipher(text, steps)
  a = ("a".."z").to_a
  b = ("A".."Z").to_a
  code_word = ""

  text.each_char do |char|
    if a.include?(char)
      index = (a.find_index(char) + steps) % 26
      code_word << a[index]
    elsif b.include?(char)
      index = (b.find_index(char) + steps) % 26
      code_word << b[index]
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