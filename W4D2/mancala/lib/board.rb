class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    @opponent_store_indexes = {}
    @opponent_store_indexes[name1] = 13
    @opponent_store_indexes[name2] = 6
    @store_indexes = {}
    @store_indexes[name1] = 6
    @store_indexes[name2] = 13

    place_stones
  end

  def place_stones
    @cups.length.times do |i|
      if i != 6 && i != 13
        @cups[i] = [:stone, :stone, :stone, :stone]
      else
        @cups[i] = []
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > @cups.length - 1
    raise "Starting cup is empty" if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos + 1
    while stones.length > 0
      j = i % @cups.length
      if j != @opponent_store_indexes[current_player_name]
        @cups[j] << stones.shift
      end
      i += 1
    end
    i -= 1
    render
    next_turn(i % cups.length, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    p @cups[ending_cup_idx]
    if @store_indexes[current_player_name] == ending_cup_idx
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return @cups[0..5].all?([]) || @cups[7..12].all?([])
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    p1_name = @store_indexes.keys[0]
    p2_name = @store_indexes.keys[1]
    p1_score = @cups[@store_indexes[@store_indexes.keys[0]]].length
    p2_score = @cups[@store_indexes[@store_indexes.keys[1]]].length
    return p1_name if p1_score > p2_score
    return p2_name if p2_score > p1_score
  end
end
