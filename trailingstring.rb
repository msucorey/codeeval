=begin
TRAILING STRING
CHALLENGE DESCRIPTION:
There are two strings: A and B. Print 1 if string B occurs at the end of
string A. Otherwise, print 0.
INPUT SAMPLE:
The first argument is a path to the input filename containing two
comma-delimited strings, one per line. Ignore all empty lines in the input file.
For example:
Hello World,World
Hello CodeEval,CodeEval
San Francisco,San Jose
OUTPUT SAMPLE:
Print 1 if the second string occurs at the end of the first string. Otherwise,
print 0.
For example:
1
1
0
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  next if line.empty?
  string_a, string_b = line.chomp.split(",")
  if string_a.chars.last(string_b.length)  == string_b.chars
    puts 1
  else
    puts 0
  end
end
