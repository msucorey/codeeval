=begin
Print to stdout the endianness, wheather it is LittleEndian or BigEndian.
=end

if [1].pack("I") == [1].pack("N")
  puts "BigEndian"
else
  puts "LittleEndian"
end
