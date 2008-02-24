class Player
  def initialize(game)
    @state = 0
    @game = game
    @round = Round.new
  end

  def start_turn
    if (@state == 0)
      @game.roll
      @state = @state + 1
    end
  end

  def refine(reroll_dice)
    if (@state > 0 && @state < 3)
      @game.roll(reroll_dice)
      @state = @state + 1
    end
  end

  def score(type_string)
    if (@state > 0)
      @state = 0
      case type_string
      when "1" then @round.ones = @game.dice.map{|d| d.num}
      when "2" then @round.twos = @game.dice.map{|d| d.num}
      when "3" then @round.threes = @game.dice.map{|d| d.num}
      when "4" then @round.fours = @game.dice.map{|d| d.num}
      when "5" then @round.fives = @game.dice.map{|d| d.num}
      when "6" then @round.sixes = @game.dice.map{|d| d.num}
      when "s" then @round.small_straight = @game.dice.map{|d| d.num}
      when "l" then @round.large_straight = @game.dice.map{|d| d.num}
      when "h" then @round.full_house = @game.dice.map{|d| d.num}
      when "t" then @round.three_of_a_kind = @game.dice.map{|d| d.num}
      when "f" then @round.four_of_a_kind = @game.dice.map{|d| d.num}
      when "y" then @round.yahtzee = @game.dice.map{|d| d.num}
      when "?" then @round.chance = @game.dice.map{|d| d.num}
      else -1
      end
    end
  end

  def print_board
    puts "1s\t\t#{@round.ones}"
    puts "2s\t\t#{@round.twos}"
    puts "3s\t\t#{@round.threes}"
    puts "4s\t\t#{@round.fours}"
    puts "5s\t\t#{@round.fives}"
    puts "6s\t\t#{@round.sixes}"
    puts "bonus\t\t#{@round.upper_bonus}"
    puts "upper total\t#{@round.upper_total}"
    puts "3 of a kind\t#{@round.three_of_a_kind}"
    puts "4 of a kind\t#{@round.four_of_a_kind}"
    puts "full house\t#{@round.full_house}"
    puts "small_straight\t#{@round.small_straight}"
    puts "large_straight\t#{@round.large_straight}"
    puts "yahtzee\t\t#{@round.yahtzee}"
    puts "chance\t\t#{@round.chance}"
    puts "lower total\t#{@round.lower_total}"
    puts "grand total\t#{@round.score}"
  end
end
