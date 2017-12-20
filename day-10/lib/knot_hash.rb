class KnotHash

  def initialize(size)
    @loop = (0..size - 1).to_a
  end

  def simple_hash(lengths)
    skipSize = 0
    rotated = 0

    lengths.each do |length| 
      reversedElements = @loop.take(length).reverse
      remainingElements = @loop.drop(length)
      @loop = reversedElements + remainingElements
      @loop.rotate!(length + skipSize)
      rotated += length + skipSize
      skipSize+=1
    end
    return @loop.rotate!(@loop.length - (rotated % @loop.length))
  end
end

if __FILE__ == $0 then
  knotHash = KnotHash.new 256
  lengths = File.open(ARGV[0]).first.split(",").map(&:to_i)
  simple_hashed = knotHash.simple_hash(lengths)
  puts "Product of first two: #{simple_hashed[0] *  simple_hashed[1]}"
end
