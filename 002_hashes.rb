# - Creating hashes

first_hash = Hash.new
second_hash = {}

my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {},
  :this_is_better => "than a string key",
  this_works_too: " we can use => or : without the symbol sintax",
  maybe_this_is_better: "is easier to read?",
  but_the_key_like_this: "is a symbol too!",
  to_acces_to_this_data: "with my_hash[:to_acces_to_this_data]"
}
=begin
As you can see, the values of a hash can be a number, a string, an
array, or even another hash. Keys and values are associated with a
special operator called a hash rocket: =>.

Of course, hashes don’t only take strings as keys and values.
Ruby is a pretty flexible language, so you can jam any old thing in
there and it’ll work just fine.
=end
hash = { 9 => "nine", :six => 6, im_a_symbol_too: "value" }

=begin
- Accessing values

You can access values in a hash the same way that you access elements in an array.
When you call a hash’s value by key, the key goes inside a pair of brackets, just like
when you’re calling an array by index.
=end
shoes = {
  "summer" => "sandals",
  "winter" => "boots",
  other_example: "example",
  :other_value => 2
}

shoes["summer"]   #=> "sandals"
shoes[:other_example] #=> "example"
shoes[:other_value] #=> 2
# If you try to access a key that doesn’t exist in the hash, it will return nil:
shoes["hiking"]   #=> nil
=begin
Sometimes, this behavior can be problematic for you if silently returning a nil value
could potentially wreak havoc in your program. Luckily, hashes have a fetch method that
will raise an error when you try to access a key that is not in your hash.
=end
# shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"
=begin
Alternatively, this method can return a default value instead of raising an error if the
given key is not found.
=end
shoes.fetch("hiking", "hiking boots") #=> "hiking boots"
=begin
- Adding and changing data

You can add a key-value pair to a hash by calling the key and setting the value, just like
you would with any other variable.
=end
shoes["fall"] = "sneakers"

shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}
# You can also use this approach to change the value of an existing key.

shoes["summer"] = "flip-flops"
shoes[:other_key] = "other_value"

shoes  #=> {"summer"=>"flip-flops", "winter"=>"boots", :other_example=>"example",
       #     :other_value=>2, "fall"=>"sneakers", :other_key=>"other_value"}
=begin
- Removing data

Deleting data from a hash is simple with the hash’s #delete method, which provides
the cool functionality of returning the value of the key-value pair that was deleted from
the hash.
=end
shoes.delete("summer")    #=> "flip-flops"
shoes.delete(:other_key) #=> "other_value"
shoes                     #=> {"winter"=>"boots", "fall"=>"sneakers"}
=begin
- Methods

Hashes respond to many of the same methods as arrays do since they both employ Ruby’s
Enumerable module. In the next lesson, we’ll go into far more detail on the Enumerable
module, including the differences in how the Enumerable methods behave for arrays and hashes.

A couple of useful methods that are specific to hashes are the #keys and #values methods,
which very unsurprisingly return the keys and values of a hash, respectively. Note that both
of these methods return arrays.
=end
books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer",
  :other_book => "Book",
  last_book: "last_book"
}

books.keys      #=> ["Infinite Jest", "Into the Wild", "other_book", "last_book"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer", "Book", "last_book"]

=begin
- Merging two hashes

Occasionally, you’ll come across a situation where two hashes wish to come together in holy
union. Luckily, there’s a method for that. (No ordained minister required!)
=end
hash1 = { "a" => 100, "b" => 200, :c => 400, d: 500 }
hash2 = { "b" => 254, "c" => 300, :d => 700 }
hash1.merge(hash2)      #=> { "a"=>100, "b"=>254, :c=>400, :d=>700, "c"=>300 }
=begin
Notice that the values from the hash getting merged in (in this case, the values in hash2)
overwrite the values of the hash getting… uh, merged at (hash1 here) when the two hashes
have a key that’s the same.

- Symbols as hash keys

In this lesson, we mostly used strings for hash keys, but in the real world, you’ll
almost always see symbols (like :this_guy) used as keys. This is predominantly because
symbols are far more performant than strings in Ruby, but they also allow for a much cleaner
syntax when defining hashes. Behold the beauty:
=end

# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}
=begin
That last example brings a tear to the eye, doesn’t it? Notice that the hash rocket and
the colon that represents a symbol have been mashed together. This unfortunately only works
for symbols, though, so don’t try { 9: "value" } or you’ll get a syntax error.

When you use the cleaner ‘symbols’ syntax to create a hash, you’ll still need to use the
standard symbol syntax when you’re trying to access a value. In other words, regardless of
which of the above two syntax options you use when creating a hash, they both create symbol
keys that are accessed the same way.
=end
american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"

puts "File Works!"
