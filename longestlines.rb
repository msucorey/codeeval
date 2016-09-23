lines = File.readlines(ARGV[0])

n = lines.first.chomp.to_i

lines.shift

lines.sort! { |line1, line2| line2.length <=> line1.length }

for i in (1..n)
  puts lines[i - 1]
end
