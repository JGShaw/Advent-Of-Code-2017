class HexGrid

  def distance_moved(instructions)
    x = 0
    y = 0
    z = 0
    furthest = 0
    distance = 0

    instructions.each do |instruction|
      case instruction
      when "n"
        y += 1
        z -= 1
      when "ne"
        x += 1
        z -= 1
      when "se"
        x += 1
        y -= 1
      when "s"
        y -= 1
        z += 1
      when "sw"
        x -= 1
        z += 1
      when "nw"
        x -= 1
        y += 1
      end
      distance = [x.abs, y.abs, z.abs].max
      furthest = distance if distance > furthest
    end
    return [distance, furthest]
  end
end

if __FILE__ == $0 then
  instructions = File.open(ARGV[0]).first.split(",")
  grid = HexGrid.new
  distance = grid.distance_moved(instructions)
  puts "Final distance: #{distance[0]}"
  puts "Max distance: #{distance[1]}"
end
