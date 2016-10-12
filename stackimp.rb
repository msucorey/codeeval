=begin
STACK IMPLEMENTATION
CHALLENGE DESCRIPTION:
Write a program which implements a stack interface for integers. The interface
should have ‘push’ and ‘pop’ functions. Your task is to ‘push’ a series of
integers and then ‘pop’ and print every alternate integer.
INPUT SAMPLE:
Your program should accept a file as its first argument. The file contains a
series of space delimited integers, one per line.
For example:
1 2 3 4
10 -2 3 4
OUTPUT SAMPLE:
Print to stdout every alternate space delimited integer, one per line.
For example:
4 2
4 -2
SUBMIT SOLUTION
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  ints = line.split(" ").map(&:to_i)
  output = []
  count = ints.length
  alt_flag = true
  while count > 0
    this_int = ints.pop
    output << this_int if alt_flag
    alt_flag = !alt_flag
    count -= 1
  end
  puts output.join(" ")
end
