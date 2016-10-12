def fizz_buzz(x, y, n)
  sequence = []
  1.upto(n) do |i|
    this_entry = ""
    this_entry << "F" if i % x == 0
    this_entry << "B" if i % y == 0
    this_entry << i.to_s if this_entry == ""
    sequence << this_entry
  end
  sequence
end

file = ARGV[0]

contents = File.readlines(file)

contents.each do |line|
    x, y, n = line.chomp.split(" ")
    sequence = fizz_buzz(x.to_i, y.to_i, n.to_i)
    puts sequence.join(" ")
end

#############################################################################
