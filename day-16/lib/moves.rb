class Spin
  def initialize(move)
    @size = move.match(/s(\d+)/)[1].to_i
  end
  def execute(input)
    input.rotate!(-@size)
  end
end

class Exchange
  def initialize(move)
    args = move.match(/x(\d+)\/(\d+)/)
    @i1 = args[1].to_i
    @i2 = args[2].to_i
  end
  def execute(input)
    input[@i1], input[@i2] = input[@i2], input[@i1]
    return input
  end
end

class Partner
  def initialize(move)
    args = move.match(/p(\w+)\/(\w+)/)
    @p1 = args[1]
    @p2 = args[2]
  end
  def execute(input)
    i1 = input.index(@p1)
    i2 = input.index(@p2)
    input[i1], input[i2] = input[i2], input[i1]
    return input
  end
end
