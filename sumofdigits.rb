=begin
SUM OF DIGITS
CHALLENGE DESCRIPTION:
Given a positive integer, find the sum of its constituent digits.
INPUT SAMPLE:
The first argument will be a path to a filename containing positive integers,
one per line. E.g.
23
496
OUTPUT SAMPLE:
Print to stdout, the sum of the numbers that make up the integer, one per
line. E.g.
5
19
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  sum = 0
  line.chomp.chars.each do |char|
    sum += char.to_i
  end
  puts sum
end
