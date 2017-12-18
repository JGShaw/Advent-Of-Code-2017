class Bucket

  attr_reader :value
  
  def initialize(value)
    @value = value
  end

  def empty
    tmp = @value
    @value = 0
    return tmp
  end

  def increase
    @value+=1
  end

  def <=>(otherBucket)
    @value <=> otherBucket.value
  end

end
