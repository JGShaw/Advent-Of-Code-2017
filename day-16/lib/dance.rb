require_relative "moves"

class Dance

  def dance(programs, moves) 
    dance_lots(1, programs, moves)
  end

  def dance_lots(reps, programs, textMoves)
    moves = generate_moves(textMoves)
    reps.times do |rep|
      puts rep
      moves.each do |move|
        move.execute(programs)
      end
    end
    return programs
  end

  private

  def generate_moves(textMoves)
    moves = []
    textMoves.each do |move|
      moves << case move[0]
      when "s"
        Spin.new(move)
      when "x"
        Exchange.new(move)
      when "p"
        Partner.new(move)
      end
    end
    return moves
  end

end

if __FILE__ == $0 then
  programs = ("a".."p").to_a
  dance = Dance.new
  input = File.open(ARGV[0]).first.strip!.split(",")
  puts "After dance: #{dance.dance(programs, input).join("")}"
  puts "After 1 billion dances: #{dance.dance_lots(1000000000, programs, input).join("")}"
end
