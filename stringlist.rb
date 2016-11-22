=begin
STRING LIST
CHALLENGE DESCRIPTION:
Credits: Challenge contributed by Max Demian.
You are given a number N and a string S. Print all of the possible ways to
write a string of length N from the characters in string S, comma delimited in
alphabetical order.
INPUT SAMPLE:
The first argument will be the path to the input filename containing the test
data. Each line in this file is a separate test case. Each line is in the
format: N,S i.e. a positive integer, followed by a string (comma separated).
E.g.
1,aa
2,ab
3,pop
OUTPUT SAMPLE:
Print all of the possible ways to write a string of length N from the
characters in string S comma delimited in alphabetical order, with no
duplicates. E.g.
a
aa,ab,ba,bb
ooo,oop,opo,opp,poo,pop,ppo,ppp
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  n = line[0].to_i
  words = []
  chars = line.chomp[2..-1]
  chars.split("").repeated_permutation(n).each do |combo|
    words << combo.join
  end
  puts words.uniq.sort.join(",")
end
