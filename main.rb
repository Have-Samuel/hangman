require 'yaml'
require './player'
require './secret_word'
require './serialize'

# Class to instantiate Player and SecretWord objects, and methods provide the game logic
class Game
  # Uses the Serialize module as well
  include Serialize
  attr_accessor :word, :player, :display, :life

  def initialize
    @word = SecretWord.new # SecretWord object
    @player = Player.new # Player object
    @display = '' # Displayed letters
    @life = 8 # Number of lives
    load_or_new # Load the game state or start a new game
  end

  # If new game, create secret word before play, else save game before play
  def load_or_new
    puts "Enter '1' for a new game or '2' to load the saved game."
    input = gets.chomp
    if input == '1'
      @word.select_word # Select a new secret word
      play_game
    else
      load_game
      puts @display.load('')
    end
  end

  # Make underscore based on the secret word length
  def make_display
    if @display == '' # This only runs if the display is empty, otherwise it will assume it's a loaded game
      length = word.choice.strip!.length
      @display = Array.new(length, '-')
      puts "\nA secret word awaits. Godspeed.\n"
      puts @display.join(' ') # This turns the array into a string
      puts "\n"
    else
      false
    end
  end

  # Check if 'save' is entered and get desired file name
  def save_game
    if player.guess == 'save'
      puts 'Enter a file name (no space).'
      filename = gets.chomp
      to_yaml(filename)
    end
  end

  # Check to see if player guess matches letter in secret word
  def match
    return false if @player.guess == 'save'

    if @word.choice.include?(@player.guess)
      word_array = @word.choice.split('')
      word_array.each_with_index do |letter, index|
        @display[index] = letter if letter == @player.guess # This will give you a prompt to show you whether the letter exist or not
      end
      puts "\nPhew, '#{@player.guess}' is in the word." # THen we get the display on the screen showing the letter within the word
      puts "\n"
      puts @display.join(' ')
      puts "\n"
    else
      miss
    end
  end

  # If wrong guess add to "misses" history and this MISS method in the GAME class is paasing that value into that array in the player class
  def miss
    return false if @player.guess == 'save'

    player.misses << @player.guess
    puts "\n '#{@player.guess}' is not the word.\n" # This will show the player that the letter is not in the word
    puts "Misses: #{player.misses.join(', ')}\n" # This will show the player the letters that they have guessed
    @life -= 1 # This will subtract one life from the player
    puts @display.join(' ') # This will show the player the letters that they have guessed
    puts "\n" 
  end

  # Check if there is a winner or loser. Or player has guessed secret word
  def check_winner
    if @display == @word.choice.split(//) # This checks if the display is equal to the secret word
      puts "Congratulations! You win.\n" # This will show the player that they have won
      @life = 0 # This will end the game
    elsif @life.zero? # This checks if the player has no lives left
      puts "Unlucky! The word was '#{@word.choice}'." # This will show the player that they have lost
    end
  end


end
