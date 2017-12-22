class Layer
  attr_reader :scannerPos, :severity

  def initialize(layer, depth = nil)
    @layer = layer
    @scannerPos = 0
    @direction = 1
    @maxDepth = (depth - 1) if depth
    @severity = if depth then layer * depth else 0 end
  end

  def tick
    @scannerPos += @direction
    @direction *= (-1) if @scannerPos == 0 || @scannerPos == @maxDepth
  end
  
  def to_s
    "L: #{@layer}, SP: #{@scannerPos}, MD: #{@maxDepth}, SEV: #{severity}"
  end

end
