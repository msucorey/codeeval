=begin
UNIQUE ELEMENTS
CHALLENGE DESCRIPTION:
You are given a sorted list of numbers with duplicates. Print out the sorted
list with duplicates removed.
INPUT SAMPLE:
File containing a list of sorted integers, comma delimited, one per line. E.g.
1,1,1,2,2,3,3,4,4
2,3,4,5,5
OUTPUT SAMPLE:
Print out the sorted list with duplicates removed, one per line.
E.g.
1,2,3,4
2,3,4,5
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  sorted_list = line.chomp.split(",")
  output_list = []
  last = ""
  sorted_list.each do |item|
    next if item == last
    output_list << item
    last = item
  end
  puts output_list.join(",")
end
