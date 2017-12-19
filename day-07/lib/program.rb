class Program

  attr_reader :name, :weight, :subprograms
  attr_accessor :parent

  def initialize(name, weight)
    @name = name
    @weight =  weight
    @subprograms = []
  end

  def add_subprogram subprogram
    subprogram.parent = self
    @subprograms.push(subprogram)
  end

  def holding depth
    sum = @weight
    @subprograms.each do |subprogram|
      sum += subprogram.holding (depth + 1)
    end
    puts "\t" * depth +  "#{sum.to_s} (#{@weight.to_s})"
    return sum
  end

end
