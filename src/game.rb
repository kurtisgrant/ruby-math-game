class Game
  def initialize
    @question_number = 1
    setup
    @current_player = @player_1
    start_game_loop
  end
  
  def setup 
    puts "\nWelcome to Math Game!\n\nLet's get your names"
    print "Player 1: "
    @player_1 = Player.new(gets.chomp)
    print "Player 2: "
    @player_2 = Player.new(gets.chomp)
    puts "\nNice to meet you #{@player_1.name} and #{@player_2.name}!"
    puts "\nLet's get started!\n\n"
  end

  def start_game_loop 
    while !winner? do
      turn
    end
    winner = winner?
    div_puts "GAME OVER"
    puts "\nThe winner is #{winner.name}!\n\n"
  end

  def turn
    div_puts "NEW TURN"
    puts "\n#{@current_player.name} you're up."
    print question = Question.new
    input = gets.chomp.to_i
    correct = question.correct?(input)
    puts "\nThat is #{correct ? 'correct' : 'very wrong'}."
    @current_player.strike unless correct
    puts lives
    next_player
  end

  def next_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def lives
    "\n#{@player_1.name} =>  #{@player_1.lives}/3 lives  |  #{@player_2.name} =>  #{@player_2.lives}/3 lives"
  end

  def winner?
    if @player_1.lives < 1
      return @player_2
    elsif @player_2.lives < 1
      return @player_1
    else return nil
    end
  end

  def div_puts(txt)
    puts "\n------- #{txt} -------"
  end

end