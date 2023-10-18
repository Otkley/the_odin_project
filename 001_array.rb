=begin
https://www.rubyguides.com/2015/05/ruby-arrays/

- Creating arrays

Here are two basic arrays:
=end
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]
extra_array = []
w_array = %w[1 2 3 4 5 6 7] #=> ["1", "2", "3", "4", "5", "6", "7"]
=begin
Both arrays have five elements separated by commas. The first array contains integers,
while the second array contains strings.

Arrays are commonly created with an array literal, which is simply a special syntax used to
create instances of an array object. To create a new array using an array literal, use square
brackets ([]).

An array can also be created by calling the Array.new method. When you call this method,
you can also include up to 2 optional arguments (initial size and default value):
=end
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, 7)         #=> [7, 7, 7]
Array.new(3, true)      #=> [true, true, true]

=begin
- Accessing elements

Every element in an array has an index, which is a numerical representation of the element’s
position in the array. Like most other programming languages, Ruby arrays use zero-based indexing,
which means that the index of the first element is 0, the index of the second element is 1,
and so on. Accessing a specific element within an array is as simple as calling myArray[x],
where x is the index of the element you want. Calling an invalid position will result in nil.
Ruby also allows the use of negative indices, which return elements starting from the end of an
array, starting at [-1].
=end
str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"
=begin
Finally, Ruby provides the #first and #last array methods, which should be self-explanatory.
In addition, these methods can take an integer argument, e.g., myArray.first(n) or myArray.last(n),
which will return a new array that contains the first or last n elements of myArray, respectively.
=end
str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]

=begin
- Adding and removing elements

Adding an element to an existing array is as simple as using the #push method or the shovel
operator <<. Both methods will add elements to the end of an array and return that array with
the new elements. The #pop method will remove the element at the end of an array and return the
element that was removed.
=end
num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array << 5            #=> [1, 2, 3, 4, 5]
num_array.pop             #=> 5
num_array                 #=> [1, 2, 3, 4]
=begin
The methods #shift and #unshift are used to add and remove elements at the beginning of an array.
The #unshift method adds elements to the beginning of an array and returns that array
(much like #push). The #shift method removes the first element of an array and returns that element
(much like #pop).
=end
num_array = [2, 3, 4]

num_array.unshift(1)      #=> [1, 2, 3, 4]
num_array.shift           #=> 1
num_array                 #=> [2, 3, 4]
# It’s also useful to know that both #pop and #shift can take integer arguments:
num_array = [1, 2, 3, 4, 5, 6]

num_array.pop(3)          #=> [4, 5, 6]
num_array.shift(2)        #=> [1, 2]
num_array                 #=> [3]

=begin
- Adding and subtracting arrays

What do you think will be the outcome of [1, 2, 3] + [3, 4, 5]?

If you guessed [1, 2, 3, 3, 4, 5], congratulations!
Adding two arrays will return a new array built by concatenating them, similar to string
concatenation. The concat method works the same way.
=end
a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]
=begin
To find the difference between two arrays, you can subtract them using -. This method returns a
copy of the first array, removing any elements that appear in the second array.
=end
[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]

=begin
- Methods

Ruby gives you many methods to manipulate arrays and their contents (over 150!),
many of which are beyond the scope of this lesson. For the full documentation, go to
http://ruby-doc.org/, click on the “Current” tab in the top left corner, scroll down to the
“Class and Module Index” section on the left sidebar, and click on “Array”. There, you’ll find
the most up-to-date documentation on the various methods available to Ruby arrays along with
explanations.

Calling the #methods method on an array will also yield a long list of the available methods.

num_array.methods       #=> A very long list of methods
Here is a brief look at some other common array methods you might run into:
=end
[].empty?               #=> true
[[]].empty?             #=> false
[1, 2].empty?           #=> false

[1, 2, 3].length        #=> 3

[1, 2, 3].reverse       #=> [3, 2, 1]

[1, 2, 3].include?(3)   #=> true
[1, 2, 3].include?("3") #=> false

[1, 2, 3].join          #=> "123"
[1, 2, 3].join("-")     #=> "1-2-3"

array = [1, 2, 3, 4, 5, 5, 5]

array.clear #=> []
array.insert(0, 6) #=> [6, 1, 2, 3, 4, 5, 5, 5]
array.sample #=> returns one random element
array.sample(2) #=> returns two random elements
array.shuffle #=> returns a new array with elements of self shuffled
array.uniq #=> [1, 2, 3, 4, 5]
array.join #=> "1234555"
array.join("") #=> "1234555"
array.join(" ") #=> "1 2 3 4 5 5 5"
# String to Array
"a b c".split #=> ["a", "b", "c"]

multi_2d_array = [
  [1, "Hola"],
  [2, "Adios"]
]

multi_2d_array[0][0] #=> 1
multi_2d_array[1][1] #=> "Adios"
multi_2d_array.flatten #=> [1, "Hola", 2, "Adios"]

puts "File Works!"
