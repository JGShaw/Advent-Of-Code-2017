require 'set'

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

  def count_moves_to_cycle
    states = Set.new
    until states.member? stringify do
      states.add(stringify)
      redistribute
    end
    return states.length
  end

end
