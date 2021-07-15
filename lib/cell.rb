

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    if @ship == @coordinate
      false
      else
        true
    end
  end

  def place_ship(cruiser)
    @ship << cruiser
  end



end
