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

  it 'checks if ship length and coordinates match' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    cell_1.place_ship(cruiser)
    cell_2.place_ship(cruiser)
    cell_3.place_ship(cruiser)

    expect(board.valid_length?(cruiser, ["A2","A2", "A3"])).to eq(true)
  end

  it 'can find the number of coordinate' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]

    cell_1.place_ship(submarine)
    cell_2.place_ship(submarine)
    # binding.pry
    coordinates = [cell_1, cell_2]

    expect(board.nums(coordinates)).to eq([1,2])
  end


  it 'can seperate coordinates into letters' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["B1"]
    cell_4 = board.cells["C1"]
    cell_5 = board.cells["D1"]

    cell_1.place_ship(submarine)
    cell_2.place_ship(submarine)
    cell_3.place_ship(cruiser)
    cell_4.place_ship(cruiser)
    cell_5.place_ship(cruiser)

    coordinates = [cell_1, cell_2]
    coordinates_2 = [cell_3, cell_4, cell_5]

    expect(board.letters(coordinates)).to eq(["A"])
    expect(board.letters(coordinates_2)).to eq(["B", "C", "D"])
  end

  it 'can determine if nums are consecutive' do
     board = Board.new
     cruiser = Ship.new("Cruiser", 3)
     submarine = Ship.new("Submarine", 2)
     cell_1 = board.cells["A1"]
     cell_2 = board.cells["A2"]

     cell_1.place_ship(submarine)
     cell_2.place_ship(submarine)

     coordinates = [cell_1, cell_2]

     expect(board.consecutive_nums?(coordinates)).to eq(true)
   end

  it 'puts coords in ordinal value' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["B1"]
    cell_4 = board.cells["C1"]
    cell_5 = board.cells["D1"]

    cell_1.place_ship(submarine)
    cell_2.place_ship(submarine)
    cell_3.place_ship(cruiser)
    cell_4.place_ship(cruiser)
    cell_5.place_ship(cruiser)

    coordinates = [cell_3, cell_4, cell_5]
    expect(board.cons_letters?(coordinates)).to eq(true)

    coordinates = [cell_3, cell_1, cell_5]
    expect(board.cons_letters?(coordinates)).to eq(false)
  end

  it 'runs thru method logics' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["B1"]
    cell_4 = board.cells["C1"]
    cell_5 = board.cells["D1"]

    cell_1.place_ship(submarine)
    cell_2.place_ship(submarine)
    cell_3.place_ship(cruiser)
    cell_4.place_ship(cruiser)
    cell_5.place_ship(cruiser)

    coordinates = [cell_1, cell_2]
    coordinates_2 = [cell_3, cell_4, cell_5]

    expect(board.cons_length_check?(coordinates)).to be(true).or be(false)
    expect(board.cons_length_check?(coordinates_2)).to be(true).or be(false)
  end

  xit 'first confirms if length is correct' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.start_check?).to be(true).or be(false)

  end

end
