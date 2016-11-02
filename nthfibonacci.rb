=begin
FIBONACCI SERIES
CHALLENGE DESCRIPTION:
The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n–1) + F(n–2) when n>1. Given an integer n≥0, print out the F(n).
INPUT SAMPLE:
The first argument will be a path to a filename containing integer numbers, one per line. E.g.
5
12
OUTPUT SAMPLE:
Print to stdout, the fibonacci number, F(n). E.g.
5
144
=end

lines = File.readlines(ARGV[0])

def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  return fibonacci(n - 1) + fibonacci(n - 2)
end

lines.each do |line|
  n = line.chomp.to_i
  puts fibonacci(n)
end
