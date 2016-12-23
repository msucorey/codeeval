=begin
BIT POSITIONS
CHALLENGE DESCRIPTION:
Given a number n and two integers p1,p2 determine if the bits in position p1
and p2 are the same or not. Positions p1 and p2 are 1 based.
INPUT SAMPLE:
The first argument will be a path to a filename containing a comma separated
list of 3 integers, one list per line. E.g.
86,2,3
125,1,2
OUTPUT SAMPLE:
Print to stdout, 'true'(lowercase) if the bits are the same, else 'false'(lowercase). E.g.
true
false
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  num_strs = line.chomp.split(",")
  n = num_strs.first
  p1, p2 = num_strs[1..2]
  n_bin_as_string = n.to_i.to_s(2)
  n_bin_as_string.reverse!
  puts n_bin_as_string[p1.to_i - 1] == n_bin_as_string[p2.to_i - 1]
end
