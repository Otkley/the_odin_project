=begin
- Loop

It’s an infinite loop that will keep going unless you specifically
request for it to stop, using the break command. Most commonly, break is used with a condition,
as illustrated in the example below.
=end
puts "Loop loop"
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end
=begin
You won’t see this loop used much in Ruby. If you find yourself using loop, know that there
is probably a better loop for you out there, like one of the more specific loops below.
=end

=begin
- While

A while loop is similar to the loop loop except that you declare the condition that will
break out of the loop up front.
=end
puts "Loop while"
i = 0
while i < 10 do
 puts "i is #{i}"
 i += 1
end
=begin
This is an example of using a while loop with a count. Because you declare the condition that breaks the loop up front, the intention of your code is much clearer, making this code easier to read than our loop loop above.

You can also use while loops to repeatedly ask a question of the user until they give the desired response:
=end
puts "type no to check the msj, next type a to continue..."
while gets.chomp != "a" do
  puts "Will you go to prom with me?"
end
=begin
This example shows the flexibility advantage of a while loop: it will run until its break
condition is met, which could be for a variable number of loops or a number of loops that is
initially unknown. Who knows if your prospective prom date will say “yes” the first, fourth, or
seventy-ninth time you ask? Of course, in real life, you should really just take “no” for an
answer the first time.
=end

=begin
- Until

The until loop is the opposite of the while loop. A while loop continues for as long as the
condition is true, whereas an until loop continues for as long as the condition is false. These
two loops can therefore be used pretty much interchangeably. Ultimately, what your break condition
is will determine which one is more readable.

As much as possible, you should avoid negating your logical expressions using ! (not). First,
it can be difficult to actually notice the exclamation point in your code. Second, using
negation makes the logic more difficult to reason through and therefore makes your code more
difficult to understand. These situations are where until shines.

We can re-write our while loop examples using until.
=end
puts "Loop until"
i = 0
until i >= 10 do
 puts "i is #{i}"
 i += 1
end
=begin
You can see here that using until means that the loop will continue running until the condition i >= 10 is true.

The next example shows how you can use until to avoid the negation ! that the above while loop had to use.
=end
puts "type no to check the msj, next type a to continue..."
until gets.chomp == "a" do
  puts "Do you like Pizza?"
end
# Much more readable! And who doesn’t like Pizza.

=begin
- Ranges

What if we know exactly how many times we want our loop to run? Ruby lets us use something
called a range to define an interval. All we need to do is give Ruby the starting value,
the ending value, and whether we want the range to be inclusive or exclusive.
=end

(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d')  # a, b, c, d

=begin
- For

A for loop is used to iterate through a collection of information such as an array or range.
These loops are useful if you need to do something a given number of times while also using an
iterator.
=end
puts "Loop for"
for i in 0..5
  puts "#{i} zombies incoming!"
end
# That’s really all there is to it.

=begin
- Times

If you need to run a loop for a specified number of times, then look no further than the trusty
#times loop. It works by iterating through a loop a specified number of times and even throws in
the bonus of accessing the number it’s currently iterating through.
=end
puts "Loop times"
5.times do
  puts "Hello, world!"
end
# I’m sure you can guess what that code does. Ruby is easily readable that way!
puts "Loop times with the current value"
5.times do |number|
  puts "Alternative fact number #{number}"
end
=begin
Remember, loops will start counting from a zero index unless specified otherwise, so the first
loop iteration will output Alternative fact number 0.
=end

=begin
- Upto and Downto

Upto and Downto loops
The Ruby methods #upto and #downto do exactly what you’d think they do from their names.
You can use these methods to iterate from a starting number either up to or down to another
number, respectively.
=end

puts "Loop Upto"
5.upto(10) { |num| print "#{num} \n" }     #=> 5 6 7 8 9 10

puts "Loop Downto"
10.downto(5) { |num| print "#{num} \n" }   #=> 10 9 8 7 6 5
=begin
If you need to step through a series of numbers (or even letters) within a specific range,
then these are the loops for you.
=end

puts "File works!"
