# Investigate why truncating doesn't happen.

# 'r+' is "Read-write, starts at beginning of file", per:
# http://www.ruby-doc.org/core-2.0.0/IO.html#method-c-new

#File.open 'long.txt', 'r+b' do |f|
File.open 'long.txt', 'r+' do |f|
  f.readlines
  current = %w[ current lines ]
  current.each{|e| f.print "#{e}\n"}
end

# This should truncate:

big_array = %w[ new stuff ]
#File.open 'long.txt', 'wb' do |f|
File.open 'long.txt', 'w' do |f|
  big_array.each{|e| f.print "#{e}\n"}
end
