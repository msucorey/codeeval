=begin
LONGEST COMMON SUBSEQUENCE
CHALLENGE DESCRIPTION:
You are given two sequences. Write a program to determine the longest common
subsequence between the two strings (each string can have a maximum length of
50 characters). NOTE: This subsequence need not be contiguous. The input file
may contain empty lines, these need to be ignored.
INPUT SAMPLE:
The first argument will be a path to a filename that contains two strings per
line, semicolon delimited. You can assume that there is only one unique
subsequence per test case. E.g.
XMJYAUZ;MZJAWXU
OUTPUT SAMPLE:
The longest common subsequence. Ensure that there are no trailing empty spaces
on each line you print. E.g.
MJAU
=end



File.open(ARGV[0]).map(&:strip).reject{ |x| x.empty? }.each do |line|
  strings = line.split(";")
  string_1, string_2 = strings.first, strings.last
  str_1_char_count = Hash.new(0)
  str_2_char_count = Hash.new(0)
  string_1.chars. each { |char| str_1_char_count[char] += 1 }
  string_2.chars. each { |char| str_2_char_count[char] += 1 }
  intersection_1 = []
  intersection_2 = []
  string_1.chars.each do |char|
    if str_2_char_count[char] > 0
      intersection_1 << char
      str_2_char_count[char] -= 1
    end
  end
  size = intersection_1.count
  puts "" if size == 0
  next if size == 0
  puts intersection_1[0] if size == 1
  next if size == 1
  equal = (intersection_1 == intersection_2)
  puts intersection_1.join("") if equal
  next if equal
  string_2.chars.each do |char|
    if str_1_char_count[char] > 0
      intersection_2 << char
      str_1_char_count[char] -= 1
    end
  end
  found = false
  while size > 0
    intersection_1.combination(size).each do |comb1|
      intersection_2.combination(size).each do |comb2|
        if comb1 == comb2
          puts comb1.join("")
          found = true
        end
        break if found
      end
      break if found
    end
    break if found
    size -= 1
  end
  puts "" if !found
end
