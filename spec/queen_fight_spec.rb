require './queen_fight'

RSpec.describe QueenFight do
  describe '#in_combat?' do
    context 'when on same row' do
      letter_arr = ('a'..'h').to_a
      rev_letter_arr = letter_arr.reverse
      letter_arr.each_with_index do |letter, index|
        it "is valid for ##{index + 1} row value" do
          queen_fight = QueenFight.new("#{letter}#{index + 1}",
                                       "#{rev_letter_arr[index]}#{index + 1}")
          expect(queen_fight.in_combat?).to eql(true)
        end
      end
    end

    context 'when on same column' do
      ('a'..'h').each_with_index do |value, index|
        it "is valid for ##{value} column value" do
          queen_fight = QueenFight.new("#{value}#{rand(1..8)}",
                                       "#{value}#{index + 1}")
          expect(queen_fight.in_combat?).to eql(true)
        end
      end
    end
  end

  describe '#same_main_diag?' do
    queen_fight = QueenFight.new('c6', 'f3')

    it 'is true with correct params' do
      expect(queen_fight.send(:same_main_diag?)).to eql(true)
    end
  end

  describe '#same_side_diag?' do
    queen_fight = QueenFight.new('c6', 'f3')
    it 'is true with correct params' do
      expect(queen_fight.send(:same_main_diag?)).to eql(true)
    end
  end

  describe '#position_to_coords' do
    queen_fight = QueenFight.new('c6', 'f3')
    it 'returns valid coords' do
      actual_coords = queen_fight.send(:position_to_coords, 'c6')

      expect(actual_coords).to eql(c: 3, r: 6)
    end
  end
end
