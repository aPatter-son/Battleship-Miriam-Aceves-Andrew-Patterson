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

  end

  def valid_length(ship, coordinates)
    coordinates.count == ship.length
  end

  def nums(coordinates)
    coordinates.map do |number|
      # binding.pry
      number.coordinate[1].to_i
    end.uniq
  end

  def letters(coordinates)
    coordinates.map do |letter|
      letter.coordinate[0]
    end.uniq
  end

  def consecutive_nums(coordinates)
    (nums(coordinates)[0]..nums(coordinates)[-1]).to_a
  end

  def cons_letters(coordinates)
    ord_values = letters(coordinates).map do |let|
      let.ord
    end
  end
  
  def only_one_consec
    code "this" || "that"
  end
  # consec_num_same_letters
  # consec_letters_same_nums
  # consec_nums ("but not letters")
  # consec_letters ("but not nums")
end
