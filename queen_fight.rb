class QueenFight
  ARRAY_OF_LETTERS = ('a'..'h').to_a.freeze

  def initialize(first_queen_position, second_queen_position)
    @first_queen = position_to_coords(first_queen_position)
    @second_queen = position_to_coords(second_queen_position)
  end

  def in_combat?
    [same_row?, same_column?, same_main_diag?, same_side_diag?].include?(true)
  end

  private

  def same_row?
    @first_queen[:r] == @second_queen[:r]
  end

  def same_column?
    @first_queen[:c] == @second_queen[:c]
  end

  def same_main_diag?
    @first_queen[:c] + @first_queen[:r] == @second_queen[:c] + @second_queen[:r]
  end

  def same_side_diag?
    @first_queen[:c] - @first_queen[:r] == @second_queen[:c] - @second_queen[:r]
  end

  def position_to_coords(pos)
    column_index = ARRAY_OF_LETTERS.index(pos[0])
    return { c: column_index + 1, r: pos[-1].to_i } if !column_index.nil? &&
                                                       pos[-1].to_i.to_s == pos[-1]
  end
end
