require './lib/ship'

RSpec.describe Ship do

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser).to be_a_instance_of(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.name).to eq("cruiser")
  end

  it 'has cells' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.length).to eq(3)
  end

  it 'ship has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.health).to eq(3)
  end

  it 'can determine if ship has sunk' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.sunk?).to eq(false)
  end

  it 'hits ship' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it '' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect (cruiser.sunk?).to eq(true)
  end

end
