# Class to create and store secret word
class SecretWord
  attr_accessor :choice

  def initialize
    @choice
  end

  # Pulls word (5-12 character) from file and selects a random word for secret word
  def select_word
    word_array = []
    word_list = File.open('./words.txt')
    word_list.each do |word|
      word_array << word if word.length >= 5 && word <= 12
    end
    @choice = word_array.sample
  end
end
