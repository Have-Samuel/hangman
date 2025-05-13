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

  # Default parameter value is blank incase check history finds the letter has been used
  def validate_input(input = '')
    until input.length == 1 &&  input =~ /[a-z]/
      puts "\nEnter a valid guess (one letter a - z)."
      input = gets.chomp.downcase
    end
    @guess = input # Set the guess to the input
    check_history(input)
    @guess_history << @guess
  end

  # If player has already entered a given lette, call validate_input with no argumnet to restart loop
  def check_history(input)
    if @guess_history.include?(input)
      puts " You've already tried one"
      validate_input
    else
      false
    end
  end
end
