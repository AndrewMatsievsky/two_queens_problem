## Usage
Create instance of QueenFight class with two position of queens.
Then use "in_combat?" method on instance to check whether one can hit other.
Example:

queen_fight_one = QueenFight.new('c6', 'e4')

queen_fight_one.in_combat? // return true
