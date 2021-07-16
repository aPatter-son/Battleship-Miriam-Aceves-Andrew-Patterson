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
end
