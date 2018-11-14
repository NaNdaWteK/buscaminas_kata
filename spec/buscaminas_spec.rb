describe 'Game' do
  context 'Cell' do
    it 'knows if has a bomb near its position' do
      x_bomb = 0
      y_bomb = 0
      x_cell = 0
      y_cell = 1
      bomb = Bomb.new(x_bomb, y_bomb)
      game = Game.new
      game.put_bombs(bomb)
      cell = Cell.new(x_cell, y_cell)

      expect(cell.bombs?).to be true
    end
  end
end

class Bomb
  def initialize(x_position, y_position)
    @x_position = x_position
    @y_position = y_position
  end
end

class Cell
  def initialize(x_position, y_position)
    @x_position = x_position
    @y_position = y_position
  end
  
  def bombs?
  end
end

class Game
  def put_bombs(bomb)
  end
end
