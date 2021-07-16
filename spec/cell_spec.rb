require 'pry'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_a(Cell)
  end

  it 'has coordinates' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'starts with no ship' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it 'starts empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'adds ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
  end

  it 'checks if empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'fired_upon?' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    # binding.pry
    expect(cell.fired_upon?).to eq(false)
  end

  it 'fire_upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    cell.fire_upon

    expect(cruiser.health).to eq(2)
  end

  it 'renders' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")    
  end
end
