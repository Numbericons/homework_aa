class Board
  attr_accessor :cups
  attr_reader :name1, :name2
  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
    @name1, @name2 = name1, name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.map.with_index do |cup, i|
      next if i == 13 || i == 6
      cups[i] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 13 || start_pos < 0
    raise 'Starting cup is empty' if cups[start_pos].empty?
    true
    # return true if start_pos.between(1..11)
  end

  def make_move(start_pos, current_player_name)
    hand_stones = self.cups[start_pos]
    self.cups[start_pos] = []
    until hand_stones.empty?
      start_pos = (start_pos + 1) % 14
      if (name1 == current_player_name && start_pos != 13) || (name2 == current_player_name && start_pos != 6)
        self.cups[start_pos] += [:stone]
        hand_stones = hand_stones[0...hand_stones.length - 1]
      end
    end
    render
    next_turn(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if name1 == current_player_name
      if ending_cup_idx == 6
        return :prompt
      elsif self.cups[ending_cup_idx] == [:stone]
        return :switch
      else
        return ending_cup_idx
      end
    elsif name2 == current_player_name
      if ending_cup_idx == 13
        return :prompt
      elsif self.cups[ending_cup_idx] == [:stone]
        return :switch
      else
        return ending_cup_idx
      end
    end
    # if self
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if self.cups[0..5].all? { |cup| cup.empty? } || self.cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    return :draw if self.cups[6] == self.cups[13]
    self.cups[6].length > self.cups[13].length ? name1 : name2
  end
end
