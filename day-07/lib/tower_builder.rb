require_relative 'program'

class TowerBuilder

  def find_root(lines)
    programs = {}
    mappings = {}

    lines.each do |line|
      name = extract_name line
      weight = extract_weight line
      subprograms = extract_subprograms line

      programs[name] = Program.new(name, weight)
      mappings[name] = subprograms 
    end
    build_tree(programs, mappings)

    program = programs.values.sample
    while program.parent do
      program = program.parent
    end
    return program
  end

  def extract_name line
    line.match(/^(\w+) /)[1]
  end

  def extract_weight line
    line.match(/\((\d+)\)/)[1].to_i
  end

  def extract_subprograms line
    subprograms = line.match(/-> (.*)$/)
    if subprograms
      return subprograms[1].split(", ")
    else
      return []
    end
  end

  def weight_needed_to_balance root
    weight = nil 
    root.subprograms.each do |child|
      holding = child.holding 1
      weight = holding unless weight
      unless weight == holding
        return (weight - holding).abs
      end
    end
    return 0
  end
  
  def build_tree(programs, mappings)
    programs.each_value do |program|
      if mappings[program.name] then
        mappings[program.name].each do |subprogram|
          program.add_subprogram(programs[subprogram])
        end
      end
    end
  end
end

if __FILE__ == $0 then
  towerBuilder = TowerBuilder.new
  root = towerBuilder.find_root(File.open(ARGV[0]))
  puts "Name of root #{root.name}"
  puts "Needed to balance: #{towerBuilder.weight_needed_to_balance root}"
end
