class Hanoi
  attr_reader :piece

  def initialize
    @board = Array.new(3) {Array.new}
  end

  def input_rings(num_rings)
    @num_rings = num_rings
    until num_rings == 0
      @board[0] << num_rings
      num_rings -= 1
    end
  end

  def display
    p @board
  end

  def from_stack
    loop do
      print "Pick a tower to move from"
      tower = Integer(gets)
      return tower unless @board[tower].empty?
      print "Illegal move. Tower empty"
    end
  end

  def get_piece(from_tower)
    @piece = @board[from_tower].pop
  end

  def make_move(to)
    @board[to].push(@piece)
  end

  def to_stack
    loop do
      print "Pick a tower to move to"
      tower = Integer(gets)
      return tower if @board[tower].last.nil?
      return tower unless @board[tower].last < @piece
      print "Illegal move. Tower empty"
    end
  end

  def won?
    return true if @board[1].length == @num_rings ||
                   @board[2].length == @num_rings
    return false
  end

  def run
    until won?

      display

      get_piece(from_stack)
      make_move(to_stack)
    end
    puts "YOU WIN"
  end

end

game = Hanoi.new

game.input_rings(3)
game.run
