class Ship
  attr_reader :name, :length, :health

  def initialize(name, length, health = 3)
    @name = name
    @length = length
    @health = health
  end

  def sunk?
    if @health >= 1
      false
    else
      true
    end
  end

  def hit
    @health -= 1
  end
end
