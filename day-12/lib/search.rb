require 'set'

class Search
  
  def count_groups(connections)
    remainingPrograms = Set.new
    connections.each do |connection|
      remainingPrograms << connection.match(/\d+/)[0]
    end
 
    groups = 0
    until remainingPrograms.empty? do
      groups += 1
      arr = remainingPrograms.to_a
      nextProgram = arr.pop
      remainingPrograms = Set.new arr
      connected = get_connected_group(nextProgram, connections)
      remainingPrograms = remainingPrograms - connected
    end
    return groups
  end
  
  def count_connected(source, connections)
    return get_connected_group(source, connections).size
  end

  def get_connected_group(source, connections)
    explored = Set.new []
    frontier = [source]

    until frontier.empty? do
      current = frontier.pop
      connectedTo = extract_connections(connections[current.to_i])
      connectedTo.each do |connection|
        frontier << connection unless explored.include?(connection) || frontier.include?(connection)
      end
      explored << current
    end
    return explored
  end

  def extract_connections(input) 
    input.match(/.*<-> (.*)/)[1].split(", ")
  end

end

if __FILE__ == $0 then
  search = Search.new
  connections = File.open(ARGV[0]).to_a
  puts "Connected to zero: #{search.count_connected("0", connections)}"
  puts "Number of groups: #{search.count_groups(connections)}"
end
