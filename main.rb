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
end