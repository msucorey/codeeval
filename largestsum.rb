=begin
SUM OF INTEGERS
CHALLENGE DESCRIPTION:
Write a program to determine the largest sum of contiguous integers in a list.
INPUT SAMPLE:
The first argument is a path to a filename containing a comma-separated list
of integers, one per line.
For example:
-10,2,3,-2,0,5,-15
2,3,-2,-1,10
OUTPUT SAMPLE:
Print to stdout the largest sum. In other words, of all the possible
contiguous subarrays for a given array, find the one with the largest sum, and print that sum.
For example:
8
12
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  int_array = line.chomp.split(",").map { |el| el.to_i }
  largest = int_array[0]
  1.upto(int_array.length) do |sublength|
    int_array.each_cons(sublength) do |subarray|
      count = subarray.reduce(:+)
      count > largest && largest = count
    end
  end
  puts largest
end
