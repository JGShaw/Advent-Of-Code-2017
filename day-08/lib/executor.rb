require_relative "instruction"

class Executor

  attr_reader :highestRegisterValue

  def execute lines
    @highestRegisterValue = 0
    registers = Hash.new { 0 }
    lines.each do |line|
      execute_line(line, registers)
      
      currentMax = registers.max_by{|k,v| v}
      if currentMax then
        @highestRegisterValue = currentMax[1] if currentMax[1] > @highestRegisterValue
      end
    end
    return registers
  end

  private

  def execute_line(line, registers)
    instruction = Instruction.new line
    if condition_passes?(instruction, registers)  then
      execute_instruction(instruction, registers)
    end
  end

  def condition_passes?(instruction, registers)
    registerValue =  registers[instruction.condRegister]
    value = instruction.condValue

    case instruction.condOperator
    when ">"
      registerValue > value
    when "<"
      registerValue < value
    when ">="
      registerValue >= value
    when "<="
      registerValue <= value
    when "=="
      registerValue == value
    when "!="
      registerValue != value
    end
  end

  def execute_instruction(instruction, registers)
    case instruction.opAction
    when "inc"
      registers[instruction.opRegister] += instruction.opValue
    when "dec"
      registers[instruction.opRegister] -= instruction.opValue
    end
  end

end

if __FILE__ == $0 then
  executor = Executor.new
  hash = executor.execute(File.open(ARGV[0]))
  puts "Maximum value after execution = #{hash.max_by{|k,v| v}[1]}"
  puts "Maximum value during execution = #{executor.highestRegisterValue}"
end


