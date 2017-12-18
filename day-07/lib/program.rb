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

end
