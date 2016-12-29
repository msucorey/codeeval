=begin
CLOSEST PAIR
SPONSORING COMPANY:
CHALLENGE DESCRIPTION:
Credits: Programming Challenges by Steven S. Skiena and Miguel A. Revilla
You will be given the x/y co-ordinates of several locations. You will be
laying out 1 cable between two of these locations. In order to minimise the
cost, your task is to find the shortest distance between a pair of locations,
so that pair can be chosen for the cable installation.
INPUT SAMPLE:
Your program should accept as its first argument a path to a filename. The
input file contains several sets of input. Each set of input starts with an
integer N (0<=N<=10000), which denotes the number of points in this set. The
next N line contains the coordinates of N two-dimensional points. The first of
the two numbers denotes the X-coordinate and the latter denotes the
Y-coordinate. The input is terminated by a set whose N=0. This set should not
be processed. The value of the coordinates will be less than 40000 and
non-negative. eg.
5
0 2
6 67
43 71
39 107
189 140
0
OUTPUT SAMPLE:
For each set of input produce a single line of output containing a floating
point number (with four digits after the decimal point) which denotes the
distance between the closest two points. If there is no such two points in the
input whose distance is less than 10000, print the line INFINITY. eg.
36.2215
=end


lines = File.readlines(ARGV[0])

numpoints = lines.first.chomp.to_i
pointer = 1

while numpoints != 0
  coords = []
  numpoints.times do |n|
    num_strs = lines[pointer].chomp.split(" ")
    x_coord = num_strs.first.to_i
    y_coord = num_strs.last.to_i
    coords << [x_coord, y_coord]
    pointer += 1
  end
  distances = []
  distance = 0.0
  coords.combination(2) do |combo|
    distance = Math.sqrt((combo[0][0] - combo[1][0])**2 + (combo[0][1] - combo[1][1])**2)
    distances << distance
  end
  puts distances.min.round(4)
  numpoints = lines[pointer].chomp.to_i
  pointer += 1
end
