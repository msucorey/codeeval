=begin
STRING SUBSTITUTION
CHALLENGE DESCRIPTION:
Credits: This challenge was contributed by Sam McCoy
Given a string S, and a list of strings of positive length, F1,R1,F2,R2,...,FN,
RN, proceed to find in order the occurrences (left-to-right) of Fi in S and
replace them with Ri. All strings are over alphabet { 0, 1 }. Searching should
consider only contiguous pieces of S that have not been subject to
replacements on prior iterations. An iteration of the algorithm should not
write over any previous replacement by the algorithm.
INPUT SAMPLE:
Your program should accept as its first argument a path to a filename. Each
line in this file is one test case. Each test case will contain a string, then
a semicolon and then a list of comma separated strings. E.g.
10011011001;0110,1001,1001,0,10,11
OUTPUT SAMPLE:
For each line of input, print out the string after substitutions have been
made.eg.
11100110
For the curious, here are the transitions for the above example: 10011011001
=> 10100111001 [replacing 0110 with 1001] => 10100110 [replacing 1001 with 0]
=> 11100110 [replacing 10 with 11]. So the answer is 11100110
=end

lines = File.readlines(ARGV[0])

lines.each do |line|
  stringS = line.split(";").first
  subs = line.chomp.split(";").last.split(",")
  find_ptr = 0
  repl_ptr = 1
  reconst_arr = [[stringS, true]]
  while repl_ptr < subs.length
    new_arr = []
    find_txt = subs[find_ptr]
    repl_txt = subs[repl_ptr]
    reconst_arr.each_index do |i|
      if reconst_arr[i][1]
        if reconst_arr[i][0].include?(find_txt)
          new_arr << [reconst_arr[i][0].partition(find_txt).first, true]
          new_arr << [repl_txt, false]
          new_arr << [reconst_arr[i][0].partition(find_txt).last, true]
          while new_arr.last[0].include?(find_txt)
            last_piece = new_arr.last[0]
            new_arr.pop
            new_arr << [last_piece.partition(find_txt).first, true]
            new_arr << [repl_txt, false]
            new_arr << [last_piece.partition(find_txt).last, true]
          end
        else
          new_arr << reconst_arr[i]
        end
      else
        new_arr << reconst_arr[i]
      end
    end
    find_ptr += 2
    repl_ptr += 2
    reconst_arr = new_arr
  end
  output = ""
  reconst_arr.each { |el| output += el[0]}
  puts output
end
