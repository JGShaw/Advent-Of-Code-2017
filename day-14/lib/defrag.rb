require_relative "../../day-10/lib/knot_hash"

class Defrag
  def count_used(input)
    hashes = generate_hashes(128, input)
    used = 0
    hashes.each do |hash|
      used += count_used_in_hash(hash)
    end
    return used
  end

  private

  def generate_hashes(count, input)
    hashes = []
    count.times do |i|
      hash = KnotHash.new(256)
      hashes << hash.complex_hash(input + "-#{i}")
    end
    return hashes
  end

  def count_used_in_hash(hash)
    count = 0
    hash.each_char do |digit|
      count += digit.to_i(16).to_s(2).count("1")
    end
    return count
  end
end

if __FILE__ == $0 then
  defrag = Defrag.new
  input = File.open(ARGV[0]).first.strip!
  puts "Used squares: #{defrag.count_used(input)}"
end
