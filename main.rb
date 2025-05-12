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
    if @display == ''
      length = word.chooice.strip!.length
      @display = Array.new(length, '-')
      puts "\nA secret word awaits. Godspeed.\n"
      puts @display.join(' ')
      puts "\n"
    else
      false
    end
  end

  
end
