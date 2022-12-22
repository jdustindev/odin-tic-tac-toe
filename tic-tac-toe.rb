BOARD = [
    ['_', '|', '_', '|', '_'],
    ['_', '|', '_', '|', '_'],
    [' ', '|', ' ', '|', ' ']
]

player_turn = :x
winner = nil

def display_board
    puts BOARD.map {|row| row.join('') }
end

until winner
    system("clear")|| system("cls")
    display_board
    input = gets.chomp
    if  input == 'q'
        break
    end
end
