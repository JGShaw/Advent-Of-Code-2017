require_relative 'layer'

class Firewall
  def trip_severity(textLayers)
    layers = create_layers(textLayers)
    tripSeverity = 0

    layers.each do |current|
      if current.scannerPos == 0 then
        tripSeverity += current.severity
      end
      layers.each do |i|
        i.tick
      end
    end
    return tripSeverity
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

end

if __FILE__ == $0 then
  firewall = Firewall.new
  layers = File.open(ARGV[0]).to_a
  puts "Severity: #{firewall.trip_severity(layers)}"
end
