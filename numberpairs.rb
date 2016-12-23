=begin
NUMBER PAIRS
CHALLENGE DESCRIPTION:
You are given a sorted array of positive integers and a number 'X'. Print out
all pairs of numbers whose sum is equal to X. Print out only unique pairs and
the pairs should be in ascending order
INPUT SAMPLE:
Your program should accept as its first argument a filename. This file will
contain a comma separated list of sorted numbers and then the sum 'X',
separated by semicolon. Ignore all empty lines. If no pair exists, print the
string NULL e.g.
1,2,3,4,6;5
2,4,5,6,9,11,15;20
1,2,3,4;50
OUTPUT SAMPLE:
Print out the pairs of numbers that equal to the sum X. The pairs should
themselves be printed in sorted order i.e the first number of each pair should
be in ascending order. E.g.
1,4;2,3
5,15;9,11
NULL
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  splits = line.chomp.split(";")
  arr_str = splits.first
  numX = splits.last.to_i
  int_arr = arr_str.split(",").map(&:to_i)
  pairs = []
  int_arr.combination(2).each do |combo|
    pairs << combo if combo.inject(:+) == numX
  end
  pairs.uniq!
  pairs.sort! { |x, y| x[0] <=> y[0] }
  pair_str_arr = pairs.map { |pair| pair[0].to_s + "," + pair[1].to_s }
  !pair_str_arr.empty? && (puts pair_str_arr.join(";"))
  pair_str_arr.empty? && (puts "NULL")
end
