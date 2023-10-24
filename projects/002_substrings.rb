require 'pry-byebug'

def substrings(key, list)
  resp = {}

  key = key.downcase.split(" ")
  key.each do |k|
    k.gsub(/^\W+|\W+$/,"")
    list.each do |word|
      if k.include?(word)
        resp[word] ? resp[word] = resp[word] + 1 : resp[word] = 1
      end
    end
  end
  puts resp
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
substrings("below", dictionary)
# { "below" = 1, "low" => 1 }

substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
