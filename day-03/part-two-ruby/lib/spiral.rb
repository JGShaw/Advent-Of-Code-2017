class Spiral

  def first_value_larger_than input
    x = 0
    y = 0
    @memory = Hash.new { 0 }
    @memory[[x, y]] = 1
    directions = [:right, :up, :left, :down]

    x += 1

    largest = 1
    while largest <= input do
  
      memoryValue = calculate_memory_value(x, y)
      @memory[[x, y]] = memoryValue    
      largest = memoryValue if memoryValue > largest
     
      case directions[0]
      when :right
        if @memory.has_key? [x, y + 1] then
          x += 1
        else
          y += 1
          directions.rotate!
        end
      when :up
        if @memory.has_key? [x - 1, y] then
          y += 1
        else
          x -= 1
          directions.rotate!
        end
      when :left
        if @memory.has_key? [x, y - 1] then
          x -= 1
        else
          y -= 1
          directions.rotate!
        end
      when :down
        if @memory.has_key? [x + 1, y] then
          y -= 1
        else
          x += 1
          directions.rotate!
        end
      end

    end
    return largest
  end

  private
  
  def calculate_memory_value(x, y)
    @memory[[x + 1, y]] + @memory[[x - 1, y]] + @memory[[x, y + 1]] + @memory[[x, y - 1]] +
    @memory[[x + 1, y + 1]] + @memory[[x + 1, y - 1]] + @memory[[x - 1, y + 1]] + @memory[[x - 1, y - 1]]
  end

end


if __FILE__ == $0 then
  spiral = Spiral.new
  puts spiral.first_value_larger_than(File.open(ARGV[0]).first.to_i)
end
