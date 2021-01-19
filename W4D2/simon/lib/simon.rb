class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while @game_over == false
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    require_sequence
    if @game_over == false
      round_success_message
      add_random_color
      @sequence_length += 1
      show_sequence
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
  end

  def add_random_color
    color_idx = rand(0...COLORS.length)
    @seq << COLORS[color_idx]
  end

  def round_success_message
  end

  def game_over_message
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
