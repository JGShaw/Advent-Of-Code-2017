require_relative 'layer'

class Firewall
  def trip_severity(textLayers)
    layers = create_layers(textLayers)
    return find_total_severity(layers)
  end

  def delay_to_get_through(textLayers)
    delay = 0
    pipeline = []
    layers = create_layers(textLayers)
    
    while true do
      pipeline << 0
  
      layers.each_with_index do |layer,index|
        if delay - index >= 0 then 
          pipeline[delay - index] += 1 if layer.scanner_catches?
        end
      end

      if delay - layers.length >= 0 then
        break if pipeline[delay - layers.length] == 0
      end

      layers.map(&:tick)
      delay += 1

    end
    return delay - layers.length
  end

  private

  def create_layers(textLayers)
    nextLayer = 0
    layers = []
    textLayers.each do |text|
      numbers = text.match(/(\d+): (\d+)/)
      layerNumber = numbers[0].to_i
      layerDepth = numbers[2].to_i

      until layerNumber == nextLayer do
        layers << Layer.new(nextLayer)
        nextLayer += 1    
      end      

      layers << Layer.new(layerNumber, layerDepth)
      nextLayer += 1
    end
    return layers
  end

  def find_total_severity(layers)
    tripSeverity = 0
    layers.each do |current|
      tripSeverity += current.severity if current.scanner_catches?
      layers.map(&:tick)
    end
    return tripSeverity
  end

end

if __FILE__ == $0 then
  firewall = Firewall.new
  layers = File.open(ARGV[0]).to_a
  puts "Severity: #{firewall.trip_severity(layers)}"
  puts "Delay to get through: #{firewall.delay_to_get_through(layers)}"
end
