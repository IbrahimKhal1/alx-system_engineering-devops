#!/usr/bin/env ruby
#Project done by Ibrahimkhal1

puts ARGV[0].scan(/\[from:(.*?)\]\s\[to:(.*?)\]\s\[flags:(.*?)\]/).join(',')