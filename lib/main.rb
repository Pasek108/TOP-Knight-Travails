# frozen_string_literal: true

def knight_moves(from, to)
  # [x, y, parent_index_in_queue]
  # first(2) to ommit parent in comparision
  queue = [[*from, nil]]

  index = 0
  while index < queue.length
    return get_final_path(queue, index) if queue[index].first(2) == to

    available_moves = get_moves(queue[index], queue, index)
    queue.push(*available_moves)

    index += 1
  end

  nil
end

def get_final_path(queue, start_index)
  # creates path by going trough parents
  path = []
  index = start_index

  loop do
    path << queue[index].first(2)
    index = queue[index][2]
    break if index.nil?
  end

  path.reverse
end

def get_moves(from, queue, parent)
  moves = [
    # top left
    [from[0] - 2, from[1] + 1, parent],
    [from[0] - 1, from[1] + 2, parent],
    # bottom left
    [from[0] - 2, from[1] - 1, parent],
    [from[0] - 1, from[1] - 2, parent],
    # top right
    [from[0] + 2, from[1] + 1, parent],
    [from[0] + 1, from[1] + 2, parent],
    # bottom right
    [from[0] + 2, from[1] - 1, parent],
    [from[0] + 1, from[1] - 2, parent]
  ]

  moves.select { |move| move_available?(move.first(2), queue.map { |q_move| q_move.first(2) }) }
end

def move_available?(move, queue)
  is_correct_position = move[0].between?(0, 7) && move[1].between?(0, 7)
  is_unvisited = !queue.include?(move)

  is_correct_position && is_unvisited
end

def print_path(path)
  puts '    0   1   2   3   4   5   6   7  '
  puts '  ┌───┬───┬───┬───┬───┬───┬───┬───┐'

  (0..7).reverse_each do |i|
    print "#{i} "
    (0..7).each do |j|
      step = path.index([i, j])
      print step.nil? ? '│   ' : "│ #{step} "
    end
    puts "│ #{i}"

    puts '  ├───┼───┼───┼───┼───┼───┼───┼───┤' if i > 0
  end

  puts '  └───┴───┴───┴───┴───┴───┴───┴───┘'
  puts '    0   1   2   3   4   5   6   7  '
end

def print_knight_path(from, to)
  knight_path = knight_moves(from, to)
  knight_path_str = knight_path.map { |pos| pos.to_s.gsub(/,/, ':') }.to_s[1..-2]
  knight_path_str = knight_path_str.gsub(/"/, '').gsub(/,/, ' ->').gsub(/:/, ',')

  puts ''
  puts "Path for knight from #{from} to #{to} takes #{knight_path.length - 1} moves"
  puts ''
  print_path(knight_path)
  puts ''
  puts knight_path_str
end

print_path([])

loop do
  puts "\n-------------------------------------------------------------------\n\n"
  puts 'Input start and end positions for the knight (input \'q\' to quit):'
  puts 'Format: [row, col], [row, col] eg. [3, 3], [4, 3]'
  input = gets.downcase.chomp

  break if input == 'q'

  input = input.gsub(/[^\d|,]*/, "")
  input = input.split(',')
  input = input.reject(&:empty?)
  input = input.map(&:to_i)

  if input.length != 4 || input.any? { |i| !i.between?(0, 7) } 
    puts 'Wrong input'
    next
  end

  print_knight_path(input[0..1], input[2..3])
end

# print_knight_path([3, 3], [4, 3])
# print_knight_path([0, 0], [3, 3])
# print_knight_path([0, 0], [7, 7])
