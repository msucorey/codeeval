=begin
INPUT SAMPLE:
Your program should accept as its first argument a path to a filename containing a sequence of numbers (space delimited). The file can have multiple such lines. E.g
2 0 6 3 1 6 3 1 6 3 1
3 4 8 0 11 9 7 2 5 6 10 1 49 49 49 49
1 2 3 1 2 3 1 2 3
OUTPUT SAMPLE:
Print to stdout the first cycle you find in each sequence. Ensure that there are no trailing empty spaces on each line you print. E.g.
6 3 1
49
1 2 3
The cycle detection problem is explained more widely on wiki
Constrains:
The elements of the sequence are integers in range [0, 99]
The length of the sequence is in range [0, 50]
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  numbers = line.split(" ").map(&:to_i)
  found_cycle = false
  cycle_length = 1
  while (!found_cycle) && (cycle_length < numbers.length)
    tortoise_index = 0
    hare_index = tortoise_index + cycle_length
    while (hare_index < numbers.length - cycle_length - 1)
      if (numbers[tortoise_index] == numbers[hare_index]) && !found_cycle
        found_cycle = true
        cycle = numbers[tortoise_index..(hare_index - 1)]
        cycle_start_index = tortoise_index
        while cycle_start_index < (numbers.length - cycle_length)
          found_cycle = false if numbers[cycle_start_index] != numbers[cycle_start_index + cycle_length]
          found_cycle = false if numbers[cycle_start_index..(cycle_start_index + cycle_length - 1)] != cycle
          cycle_start_index += cycle_length
        end
        puts cycle.map(&:to_s).join(" ") if found_cycle
      end
      tortoise_index +=1
      hare_index += 1
    end
    cycle_length +=1
  end
end

__END__
