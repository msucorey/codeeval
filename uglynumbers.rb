=begin
UGLY NUMBERS
CHALLENGE DESCRIPTION:
Credits: This challenge has appeared in a google competition before.
Once upon a time in a strange situation, people called a number ugly if it was
divisible by any of the one-digit primes (2, 3, 5 or 7). Thus, 14 is ugly, but
13 is fine. 39 is ugly, but 121 is not. Note that 0 is ugly. Also note that
negative numbers can also be ugly: -14 and -39 are examples of such numbers.
One day on your free time, you are gazing at a string of digits, something like:
123456
You are amused by how many possibilities there are if you are allowed to
insert plus or minus signs between the digits. For example you can make:
1 + 234 - 5 + 6 = 236
which is ugly. Or
123 + 4 - 56 = 71
which is not ugly.
It is easy to count the number of different ways you can play with the digits:
Between each two adjacent digits you may choose put a plus sign, a minus sign,
or nothing. Therefore, if you start with D digits there are 3^(D-1)
expressions you can make. Note that it is fine to have leading zeros for a
number. If the string is '01023', then '01023', '0+1-02+3' and '01-023' are
legal expressions.
Your task is simple: Among the 3^(D-1) expressions, count how many of them
evaluate to an ugly number.
INPUT SAMPLE:
Your program should accept as its first argument a path to a filename. Each
line in this file is one test case. Each test case will be a single line
containing a non-empty string of decimal digits. The string in each test case
will be non-empty and will contain only characters '0' through '9'. Each
string is no more than 13 characters long. E.g.
1
9
011
12345
OUTPUT SAMPLE:
Print out the number of expressions that evaluate to an ugly number for each
test case, each one on a new line. E.g.
0
1
6
64
=end

lines = File.readlines(ARGV[0])

def is_ugly?(n)
  ((n % 2) == 0) || ((n % 3) == 0) || ((n % 5) == 0) || ((n % 7) == 0)
end

def compute(string)
  return string.to_i if string.size == 1
  accumulator = 0
  operator = ""
  this_number = 0
  buffer = ""
  string.chars.each do |char|
    if char == "+"
      this_number = buffer.to_i
      buffer = ""
      if operator == "+"
        accumulator += this_number
        operator = "+"
      elsif operator == "-"
        accumulator -= this_number
        operator = "+"
      else
        accumulator = this_number
        operator = "+"
      end
    elsif char == "-"
      this_number = buffer.to_i
      buffer = ""
      if operator == "+"
        accumulator += this_number
        operator = "-"
      elsif operator == "-"
        accumulator -= this_number
        operator = "-"
      else
        accumulator = this_number
        operator = "-"
      end
    else
      buffer += char
    end
  end
  this_number = buffer.to_i
  if operator == "+"
    accumulator += this_number
  elsif operator == "-"
    accumulator -= this_number
  else
    accumulator = this_number
  end
  accumulator
end


lines.each do |line|
  num_strings = []
  result = 0
  digits = line.chomp.chars
  num_strings << digits.first
  digits = digits[1..-1]
  while digits.count > 0
    new_array = []
    num_strings.each do |string|
      new_array << string + digits.first
      new_array << string + "+" + digits.first
      new_array << string + "-" + digits.first
    end
    num_strings = new_array.dup
    digits = digits[1..-1]
  end
  num_strings.each do |num_string|
    result +=1 if is_ugly?(compute(num_string))
  end
  puts result
end
