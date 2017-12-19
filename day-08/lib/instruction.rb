class Instruction
  attr_reader :opRegister, :opAction, :opValue, :condRegister, :condOperator, :condValue

  def initialize(command)
    parts = command.split(' ')
    @opRegister = parts[0]
    @opAction = parts[1]
    @opValue = parts[2].to_i
    @condRegister = parts[4]
    @condOperator = parts[5]
    @condValue = parts[6].to_i
  end

end

