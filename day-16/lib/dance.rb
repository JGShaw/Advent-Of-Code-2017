class Dance

  def dance(programs, moves)
    moves.each do |move|
      case move[0]
      when "s"
        args = move.match(/s(\d+)/)
        spin(programs, args[1].to_i)
      when "x"
        args = move.match(/x(\d+)\/(\d+)/)
        exchange(programs, args[1].to_i, args[2].to_i)
      when "p"
        args = move.match(/p(\w+)\/(\w+)/)
        partner(programs, args[1], args[2])
      end
    end
    return programs
  end

  def dance_lots(reps, programs, moves)
    reps.times do |rep|
      puts rep
      dance(programs, moves)
    end
    return programs
  end

  def spin(input, count)
    input.rotate!(-count)
  end

  def exchange(input, i1, i2)
    input[i1], input[i2] = input[i2], input[i1]
    return input
  end

  def partner(input, p1, p2)
    i1 = input.index(p1)
    i2 = input.index(p2)
    input[i1], input[i2] = input[i2], input[i1]
    return input
  end

end

if __FILE__ == $0 then
  programs = ("a".."p").to_a
  dance = Dance.new
  input = File.open(ARGV[0]).first.strip!.split(",")
  puts "After dance: #{dance.dance(programs, input).join("")}"
  puts "After 1 billion dances: #{dance.dance_lots(1000000000, programs, input).join("")}"
end
