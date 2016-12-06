=begin
FOLLOWING INTEGER
CHALLENGE DESCRIPTION:
Credits: This challenge has appeared in a past google competition
You are writing out a list of numbers.Your list contains all numbers with
exactly Di digits in its decimal representation which are equal to i, for each
i between 1 and 9, inclusive. You are writing them out in ascending order. For
example, you might be writing every number with two '1's and one '5'. Your
list would begin 115, 151, 511, 1015, 1051. Given N, the last number you
wrote, compute what the next number in the list will be. The number of 1s, 2s,
..., 9s is fixed but the number of 0s is arbitrary.
INPUT SAMPLE:
Your program should accept as its first argument a path to a filename. Each
line in this file is one test case. Each test case will contain an integer n <
10^6. E.g.
115
842
8000
OUTPUT SAMPLE:
For each line of input, generate a line of output which is the next integer in
the list. E.g.
151
2048
80000
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  digit_count = Array.new(10, 0)
  this_number = line.chomp.to_i
  line.chomp.chars { |char| digit_count[char.to_i] += 1 }
  n_digit_numbers = line.chomp.chars.permutation.map { |perm| perm.join.to_i }
  n_digit_numbers.sort!
  if this_number == n_digit_numbers.last
    digits = this_number.to_s.chars + ["0"]
    n_digit_numbers = digits.permutation.map { |perm| perm.join.to_i }
    n_digit_numbers.sort!
    n_digit_numbers.each do |number|
      if number > this_number
        puts number
        break
      end
    end
  else
    n_digit_numbers.each do |number|
      if number > this_number
        puts number
        break
      end
    end
  end
end
