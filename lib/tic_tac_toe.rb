require 'pry'


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6], 
  [2,5,8],
  [1,4,7]
]


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
     return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
     return combo 
    end 
   end
    return FALSE
   
end

def full?(board)
  if board.include?(" ")
    FALSE
  else
    TRUE
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    TRUE
  else
    FALSE
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    TRUE
  else
    FALSE
  end
end

def winner(board)
 if won?(board) 
  return board[won?(board)[0]]
else
  nil 
end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i -1
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
  board = board
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |posit|
    if posit == "X" || posit == "O"
      count += 1
    end
  end
     count
 end


def current_player(board)
  if (turn_count(board) % 2).even?
    "X"
  else
    "O"
  end
end

def play(board)
   until over?(board) do 
    puts "Enter in 1-9 to make move."
    input = gets.strip
    input = input_to_index(input)
    if position_taken?(board, input)
      puts "Position take, enter another input"
     else
      move(board, input, current_player(board))
    end
    
     if won?(board)
       binding.pry
       puts "Congratulations #{winner(board)}!"
     elsif draw?(board)
      puts "Cat's Game!"
     end
  
 
  end
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end









































































