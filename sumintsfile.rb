lines = File.readlines(ARGV[0])

sum = 0

lines.each do |line|
  sum += line.chomp.to_i
end

puts sum
