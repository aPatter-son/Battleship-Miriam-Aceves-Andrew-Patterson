require 'pry'
class Board
  attr_reader :cells

  def initialize
    @cells = {
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"),
    "A3" => Cell.new("A3"),
    "A4" => Cell.new("A4"),
    "B1" => Cell.new("B1"),
    "B2" => Cell.new("B2"),
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"),
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"),
    "C3" => Cell.new("C3"),
    "C4" => Cell.new("C4"),
    "D1" => Cell.new("D1"),
    "D2" => Cell.new("D2"),
    "D3" => Cell.new("D3"),
    "D4" => Cell.new("D4")}
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end


  def valid_placement?(ship, coordinates)
    start_check?(ship, coordinates)
  end

  def start_check?(ship, coordinates)
    if valid_length?(ship, coordinates) && !overlapping?(coordinates)
      cons_length_check?(coordinates)
    else
      false
    end
  end

  def cons_length_check?(coordinates)
    if nums_length?(coordinates) && letters_length?(coordinates) == 1
      false
    elsif nums_length?(coordinates) == 1
      cons_letter?(coordinates)
    elsif letters_length?(coordinates) == 1
    consecutive_nums?(coordinates)
    else
      false
    end
  end

  def valid_length?(ship, coordinates)
    coordinates.count == ship.length
  end

  def overlapping?(coordinates)
    coordinates.any? {|coordinate| !@cells[coordinates].nil?}
  end

  def nums(coordinates)
    coordinates.map do |number|
      number.coordinate[1].to_i
    end.uniq
  end

  def letters(coordinates)
    coordinates.map do |letter|
      letter.coordinate[0]
    end.uniq
  end

  def consecutive_nums?(coordinates)
    num_coordinates = nums(coordinates)
    if coordinates.length == 2
      num_coordinates[0] == (num_coordinates[1] - 1) ? true : false
    else num_coordinates.length == 3
      (num_coordinates[0] == (num_coordinates[1] - 1) && num_coordinates[1]) == (num_coordinates[2] - 1) ? true : false
    end
  end

  def cons_letters?(coordinates)
    ord_values = []
    letters(coordinates).map do |let|
      ord_values << let.ord
    end

    ord_values.each_cons(2).all? {|a, b| b == a + 1 }
  end

  def letters_length?(coordinates)
    if letters(coordinates).length == 1
      true
    else cons_letters?(coordinates)
    end
  end

  def nums_length?(coordinates)
    if nums(coordinates).length == 1
      true
    else consecutive_nums?(coordinates)
    end
  end

  def render
    # user board
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)}"
    "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)}"
    "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)}"
    "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}"

    #computer board
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}"
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}"
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}"
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}"


  end
end
