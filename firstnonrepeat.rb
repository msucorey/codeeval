=begin
FIRST NON-REPEATED CHARACTER
CHALLENGE DESCRIPTION:
Write a program which finds the first non-repeated character in a string.
INPUT SAMPLE:
The first argument is a path to a file. The file contains strings.
For example:
yellow
tooth
OUTPUT SAMPLE:
Print to stdout the first non-repeated character, one per line.
For example:
y
h
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  found = false
  i = 0
  while !found
    if line.count(line[i]) == 1
      puts line[i]
      found = true
    end
    i += 1
  end
end
