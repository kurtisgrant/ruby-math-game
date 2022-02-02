class Question
  attr_reader :answer
  def initialize
    @num_1 = rand(1...20)
    @num_2 = rand(1...20)
    @answer = @num_1 + @num_2
  end

  def to_s
    "\nWhat is #{@num_1} + #{@num_2}? "
  end

  def correct?(answer)
    @answer == answer
  end
end