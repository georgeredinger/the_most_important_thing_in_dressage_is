#!/usr/bin/env ruby
blacklist=Array.new 
f = File.open("black.list")
f.each_line {|word| blacklist << word.downcase.chomp }
text = String.new
f = File.open("clean.srt")
text = f.read  
words = text.split
freqs = Hash.new(0)
words.each do  |word|
 	freqs[word.downcase] += 1 unless blacklist.include?(word.downcase) 
end
freqs = freqs.sort_by {|x,y| y }
freqs.reverse!
freqs.each {|word, freq| puts word+' '+freq.to_s}
