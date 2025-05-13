# Class to prompt guesses, validate them , store them, and check for duplicates
class Player
  attr_accessor :guess, :misses, :guess_history

  def initialize
    @guess = '' # Initialize guess to an empty string, that involves the guesses that the player has made
    @misses = [] # Initialize misses to an empty array, that involves the letters that the player has guessed and are not in the word
    @guess_history = [] # Initialize guess_history to an empty array, that involves the letters that the player has guessed, whether right or wrong
  end

  # Get player input and pass to validation method, unless save
  def player_input
    puts 'Enter your guess (one letter a - z), or save.'
    input = gets.chomp.downcase
    if input == 'save'
      @guess = input # if the player guess is save, set the guess to save
    else
      validate_input(input) # Else validate the input
    end
  end

  
end