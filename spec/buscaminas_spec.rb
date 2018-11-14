describe 'Game' do
  context 'Game' do
    it 'game cell know how many bombs has near it' do
      x_bomb = 0
      y_bomb = 0
      x_cell = 0
      y_cell = 1
      bomb = Bomb.new(x_bomb, y_bomb)
      game = Game.new
      game.put_bombs(bomb)
      cell = Cell.new(x_cell, y_cell)

      expect(game.how_much_bombs(cell)).to eq 1
    end

    it 'game cell know has more than one bomb near' do
      x_bomb = 0
      y_bomb = 0
      x_cell = 0
      y_cell = 1
      one_bomb = Bomb.new(x_bomb, y_bomb)
      x_bomb = 2
      y_bomb = 1
      second_bomb = Bomb.new(x_bomb, y_bomb)
      game = Game.new
      game.put_bombs(one_bomb)
      game.put_bombs(second_bomb)
      cell = Cell.new(x_cell, y_cell)

      expect(game.how_much_bombs(cell)).to eq 2
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
end

class Game
  def initialize
    @bombs = []
  end

  def put_bombs(bomb)
    @bombs << bomb
  end

  def how_much_bombs(cell)
      1
  end
end
