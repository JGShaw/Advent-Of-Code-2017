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
    hashes = generate_binary_hashes(128, input)
    count = 0

    hashes.length.times do |hashNum|
      hashes[hashNum].length.times do |charNum|
        if hashes[hashNum][charNum] == '1'
          count += 1
          zero_group(hashes, hashNum, charNum)
        end
      end
    end

    #hashes.each_with_index do |hash,hashNum|
    #  hash.each_char.with_index do |char,charNum|
    #    if char == '1' then
    #      zero_group(hashes, hashNum, charNum)
    #      count += 1
    #    end
    #  end
    #end
    return count
  end


  def generate_binary_hashes(count, input)
    hashes = []
    count.times do |i|
      hash = KnotHash.new(256)
      complex_hash = hash.complex_hash(input + "-#{i}") 
      hashes << complex_hash.to_i(16).to_s(2).rjust(128, "0")
    end
    return hashes
  end

  def zero_group(hashes, hashNum, charNum)
    if hashes[hashNum][charNum] == '1' then
      hashes[hashNum][charNum] = '0'

      zero_group(hashes, hashNum + 1, charNum) if (hashNum + 1) < hashes.length 
      zero_group(hashes, hashNum - 1, charNum) if hashNum > 0
      zero_group(hashes, hashNum, charNum + 1) if (charNum + 1) < hashes[hashNum].length
      zero_group(hashes, hashNum, charNum - 1) if charNum > 0
    end
  end

end

if __FILE__ == $0 then
  defrag = Defrag.new
  input = File.open(ARGV[0]).first.strip!
  puts "Used squares: #{defrag.count_used(input)}"
  puts "Groups: #{defrag.count_groups(input)}"
end
