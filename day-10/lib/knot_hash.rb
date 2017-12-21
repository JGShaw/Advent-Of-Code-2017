class KnotHash

  def initialize(size)
    @loop = (0..size - 1).to_a
    @skipSize = 0
    @rotated = 0
  end

  def simple_hash(lengths)
    run_hash_rounds(1, lengths)
  end

  def complex_hash(input)
    lengths = ascii_to_ints(input)
    lengths = append_suffix(lengths)
    run_hash_rounds(64, lengths)
    denseHash = create_dense_hash(16, @loop)
    return ints_to_hex(denseHash)
  end

  def run_hash_rounds(count, lengths)
    count.times do
      hash(lengths)
    end
    return @loop.rotate!(@loop.length - (@rotated % @loop.length))
  end

  def ascii_to_ints(input)
    input.bytes
  end

  def append_suffix(input)
    input + [17, 31, 73, 47, 23]
  end

  def create_dense_hash(groupSize, input)
    output = []
    input.each_slice(groupSize) do |slice|
      output << slice.reduce(:^)
    end
    return output
  end

  def ints_to_hex(input)
    output = ""
    input.collect do |num|
      output += num.to_s(16).rjust(2, '0')
    end
    return output
  end

  private
  def hash(lengths) 
    lengths.each do |length| 
      reversedElements = @loop.take(length).reverse
      remainingElements = @loop.drop(length)
      @loop = reversedElements + remainingElements
      @loop.rotate!(length + @skipSize)
      @rotated += length + @skipSize
      @skipSize+=1
    end
  end

end

if __FILE__ == $0 then
  knotHash = KnotHash.new 256
  lengths = File.open(ARGV[0]).first
  simple_hashed = knotHash.simple_hash(lengths.split(",").map(&:to_i))
  puts "Product of first two for the simple hash: #{simple_hashed[0] *  simple_hashed[1]}"
  knotHash = KnotHash.new 256
  puts "The complex hash is: #{knotHash.complex_hash(lengths.strip)}"

end
