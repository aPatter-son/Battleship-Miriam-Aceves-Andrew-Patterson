require './lib/ship'

RSpec.describe Ship do

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser).to be_a_instance_of(Ship)
  end

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.name).to eq("cruiser")
  end

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.length).to eq(3)
  end

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.health).to eq(3)
  end

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.sunk?).to eq(false)
  end

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect (cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect (cruiser.sunk?).to eq(true)
  end

end
