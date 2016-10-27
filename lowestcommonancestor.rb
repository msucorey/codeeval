=begin
LOWEST COMMON ANCESTOR
CHALLENGE DESCRIPTION:
Write a program to determine the lowest common ancestor of two nodes in a binary search tree. You may hardcode the following binary search tree in your program:
    30
    |
  ____
  |   |
  8   52
  |
____
|   |
3  20
    |
   ____
  |   |
  10 29
INPUT SAMPLE:
The first argument is a path to a file that contains two values. These values represent two nodes within the tree, one per line. E.g.:
8 52
3 29
OUTPUT SAMPLE:
Print to stdout the lowest common ancestor, one per line. Lowest means the lowest depth in the tree, not the lowest value. E.g.:
30
8
=end

lines = File.readlines(ARGV[0])

BINARY_SEARCH_TREE = { 30 => { :parent => nil, :left => 8, :right => 52 },
                       8 =>  { :parent => 30, :left => 3, :right => 20 },
                       52 =>  { :parent => 30, :left => nil, :right => nil },
                       3 =>  { :parent => 8, :left => nil, :right => nil },
                       20 =>  { :parent => 8, :left => 10, :right => 29 },
                       10 =>  { :parent => 20, :left => nil, :right => nil },
                       29 =>  { :parent => 20, :left => nil, :right => nil} }

lines.each do |line|
  values = line.split(" ")
  first = values.first.to_i
  second = values.last.to_i
  first_ancestors = []
  second_ancestors = []
  parent = BINARY_SEARCH_TREE[first][:parent]
  while parent
    first_ancestors << parent
    parent = BINARY_SEARCH_TREE[parent][:parent]
  end
  parent = BINARY_SEARCH_TREE[second][:parent]
  while parent
    second_ancestors << parent
    parent = BINARY_SEARCH_TREE[parent][:parent]
  end
  lowest_common_not_found = true
  lowest_common_ancestor = nil
  if first_ancestors.include?(second)
    lowest_common_ancestor = second
    lowest_common_not_found = false
  end
  if second_ancestors.include?(first)
    lowest_common_ancestor = first
    lowest_common_not_found = false
  end
  first_ancestors.each do |ancestor|
    if second_ancestors.include?(ancestor) && lowest_common_not_found
      lowest_common_ancestor = ancestor
      lowest_common_not_found = false
    end
  end
  puts lowest_common_ancestor
end
