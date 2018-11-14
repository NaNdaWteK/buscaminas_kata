describe 'Game' do
  context 'Game' do
    it 'game cell know how many bombs has near it' do
      x_bomb = 0
      y_bomb = 0
      x_cell = 0
      y_cell = 1
      bomb = Position.new(x_bomb, y_bomb)
      game = Game.new
      game.put_bombs(bomb)
      cell = Position.new(x_cell, y_cell)

      expect(game.how_much_bombs(cell)).to eq 1
    end

    it 'game cell know has more than one bomb near' do
      x_bomb = 0
      y_bomb = 0
      x_cell = 1
      y_cell = 0
      one_bomb = Position.new(x_bomb, y_bomb)
      x_bomb = 2
      y_bomb = 1
      second_bomb = Position.new(x_bomb, y_bomb)
      game = Game.new
      game.put_bombs(one_bomb)
      game.put_bombs(second_bomb)
      cell = Position.new(x_cell, y_cell)

      expect(game.how_much_bombs(cell)).to eq 2
    end
  end
end

class Position
  def initialize(x_position, y_position)
    @x_position = x_position
    @y_position = y_position
  end

  def x_position
    @x_position
  end

  def y_position
    @y_position
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
    up_bombs(cell) + side_bombs(cell) + down_bombs(cell)
  end

  private

  def up_bombs(cell)
    bombs = 0
    @bombs.each do |bomb|
      bombs += 1 if bomb_up?(bomb, cell) && bomb_near?(bomb, cell)
    end
    bombs
  end

  def side_bombs(cell)
    bombs = 0
    @bombs.each do |bomb|
      bombs += 1 if bomb_side?(bomb, cell) && bomb_near?(bomb, cell)
    end
    bombs
  end

  def down_bombs(cell)
    bombs = 0
    @bombs.each do |bomb|
      bombs += 1 if bomb_down?(bomb, cell) && bomb_near?(bomb, cell)
    end
    bombs
  end

  def bomb_down?(bomb, cell)
    bomb.x_position == cell.x_position + 1
  end

  def bomb_side?(bomb, cell)
    bomb.x_position == cell.x_position
  end

  def bomb_up?(bomb, cell)
    bomb.x_position == cell.x_position - 1
  end

  def bomb_near?(bomb, cell)
    cell.y_position == bomb.y_position || cell.y_position + 1 == bomb.y_position || cell.y_position - 1 == bomb.y_position
  end
end
