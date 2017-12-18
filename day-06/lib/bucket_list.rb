require 'set'
require_relative 'bucket.rb'

class BucketList

  attr_reader :buckets
 
  def initialize(bucketValues)
    @buckets = []
    bucketValues.each do |bucketValue|
      @buckets.push(Bucket.new bucketValue)
    end
  end

  def redistribute
    maxBucket = @buckets.max
    index = @buckets.index(maxBucket)
    maximum = @buckets[index].empty

    maximum.downto(1) do |remaining|
      index+=1
      index = index % @buckets.size
      @buckets[index].increase
    end
  end

  def stringify
    output = "|"
    @buckets.each do |bucket|
      output << bucket.value.to_s + "|"
    end
    return output
  end

  def find_cycle
    states = []
    until states.member? stringify do
      states.push(stringify)
      redistribute
    end
    return states
  end

  def count_moves_to_cycle
    find_cycle.length
  end

  def count_cycle_size
    states = find_cycle
    return states.length - states.index(stringify)
  end

end

if __FILE__ == $0 then
  bucketValues = []
  File.open(ARGV[0]).each do |bucket|
    bucketValues.push(bucket.to_i)
  end
  buckets = BucketList.new(bucketValues)
  puts "Moves until a cycle: #{buckets.count_moves_to_cycle}"
  puts "Cycle size: #{buckets.count_cycle_size}"
end

