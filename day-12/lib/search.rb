require 'set'

class Search
  def count_connected(source, connections)
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
    return explored.size
  end

  def extract_connections(input) 
    input.match(/.*<-> (.*)/)[1].split(", ")
  end

end

if __FILE__ == $0 then
  search = Search.new
  connections = File.open(ARGV[0]).to_a
  puts "Connected to zero: #{search.count_connected("0", connections)}"
end
