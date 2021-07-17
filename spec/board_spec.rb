require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do

  it 'exists' do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it 'board has cells' do
    board = Board.new

    expect(board.cells["A1"]).to be_a(Cell)
    expect(board.cells["A1"].coordinate).to eq("A1")
  end

  it 'can determine if valid coordinate' do
    board = Board.new

    expect(board.valid_coordinate?("C3")).to eq(true)
    expect(board.valid_coordinate?("E3")).to eq(false)
  end

  xit 'can tell if placement of ship is valid' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place_ship(cruiser)
    board.place_ship(submarine)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
  end

  it 'can find the number of coordinate' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]

    cell_1.place_ship(submarine)
    cell_2.place_ship(submarine)

    expect(board.nums(board.cells)).to eq([1,2,3,4])
  end
end
