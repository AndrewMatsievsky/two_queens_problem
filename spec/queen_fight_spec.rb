require './queen_fight'

RSpec.describe QueenFight do
  describe '#in_combat?' do
    context 'when on same row' do
      letter_arr = ('a'..'h').to_a
      reversed_letter_arr = letter_arr.reverse

      letter_arr.each_with_index do |letter, index|
        it "is valid for ##{index + 1} row value" do
            queen_fight = QueenFight.new("#{letter}#{index + 1}", "#{reversed_letter_arr[index]}#{index + 1}")

            expect(queen_fight.in_combat?).to eql(true)
        end
      end
    end

    context 'when on same column' do
      ('a'..'h').each_with_index do |value, index|
        it "is valid for ##{value} column value" do
          queen_fight = QueenFight.new("#{value}#{rand(1..8)}", "#{value}#{index + 1}")

          expect(queen_fight.in_combat?).to eql(true)
        end
      end
    end

    context 'when on same main diag' do
      # two value: first and second + 9 or + 9 * times < 88
      # ('a'..'h').each_with_index do |value, index|
      #   it "is valid for ##{value} column value" do
      #     queen_fight = QueenFight.new("#{value}#{rand(1..8)}", "#{value}#{index + 1}")
      #
      #     expect(queen_fight.in_combat?).to eql(true)
      #   end
      # end
    end
  end
end
