require_relative "../../day-10/lib/knot_hash"

class Defrag
  def count_used(input)
    hashes = generate_binary_hashes(128, input)
    used = 0
    hashes.each do |hash|
      used += hash.count("1")
    end
    return used
  end

  def count_groups(input)
    0
  end

  private

  def generate_binary_hashes(count, input)
    hashes = []
    count.times do |i|
      hash = KnotHash.new(256)
      complex_hash = hash.complex_hash(input + "-#{i}") 
      hashes << complex_hash.to_i(16).to_s(2).rjust(128, "0")
    end
    return hashes
  end
end

if __FILE__ == $0 then
  defrag = Defrag.new
  input = File.open(ARGV[0]).first.strip!
  puts "Used squares: #{defrag.count_used(input)}"
end
