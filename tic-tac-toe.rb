#BOARD = [
#    ['_', '|', '_', '|', '_'],
#    ['_', '|', '_', '|', '_'],
#    [' ', '|', ' ', '|', ' ']
#]

BOARD = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil],
]

class TicTacToeGame
    def initialize(board)
        @board = board.dup
        @player_turn = 'X'
    end

    def display_board
        row1 = [
            @board[0][0] || '_', '|', @board[0][1] || '_', '|', @board[0][2] || '_'
        ]
        row2 = [
            @board[1][0] || '_', '|', @board[1][1] || '_', '|', @board[1][2] || '_'
        ]
        row3 = [
            @board[2][0] || ' ', '|', @board[2][1] || ' ', '|', @board[2][2] || ' '
        ]
        board = [row1, row2, row3]
        puts board.map {|row| row.join('') }
    end

    def parse(input)
        parsed_input = input.split(',')
        row = parsed_input[0].to_i - 1
        column = parsed_input[1].to_i - 1
        valid = input_valid?(row, column)
        unless (valid)
            return "Please input 'row,column' each between 1 and 3 (e.g. '1,1')"
        end
        unless space_empty?(row, column)
            return "Please select a space that is not already taken"
        end
        @board[row][column] = @player_turn
        nil
    end

    def input_valid?(row, column)
        row.between?(0,2) && column.between?(0,2)
    end

    def space_empty?(row, column)
        @board[row][column] != 'X' && @board[row][column] != 'Y'
    end

    def check_for_winner
        # check if winner by row
        ['X', 'Y'].each do |char|
            @board.each do |row|
                @winner = char if row.all? { |cell| cell == char }
            end
        end

        # check if winner by column
        ['X', 'Y'].each do |char|
            @board.transpose.each do |column|
                @winner = char if column.all? { |cell| cell == char }
            end
        end

        # check if winner by diagonal
        # TODO
    end

    def play
        error = nil
        until @winner
            system("clear")|| system("cls")
            puts error
            display_board
            error
            puts "#{@player_turn}'s turn:"
            input = gets.chomp
            if  input == 'q'
                break
            end
            error = parse(input)
            if error
                puts error
            else
                @player_turn == 'X' ? @player_turn = 'Y' : @player_turn = 'X'
            end
            check_for_winner
        end
        system("clear")|| system("cls")
        puts ''
        display_board
        puts "#{@winner} wins!"
    end
end

game = TicTacToeGame.new(BOARD)
game.play
