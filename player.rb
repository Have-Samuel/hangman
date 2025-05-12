# Class to prompt guesses, validate them , store them, and check for duplicates
class Player
  attr_accessor :guess, :misses, :guess_history

  def initialize
    @guess = ''
    @misses = []
    @guess_history = []
  end

  # Get player input and pass to validation method, unless save
  def player_input
    puts 'Enter your guess (one letter a - z), or save.'
    input = gets.chomp.downcase
    if input == 'save'
      @guess = input
    else
      validate_input(input)
    end
  end
end