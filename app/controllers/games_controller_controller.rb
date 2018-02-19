require 'open-uri'
require 'JSON'

class GamesControllerController < ApplicationController
  def new
    @letters = generate_grid
  end


  def score
    grid = params[:letters]
    guess = params[:question].upcase

  # a = english_word?(question)
  # b = correct_letters?(guess, grid)

  #   if a && b == true
  #     @message = "you won"
  #   elsif a == true
  #     @message = "not correct letter"
  #   else b == true
  #     @message = "not english"
  #   end
  # end

  private



  def generate_grid
    @letters = []
    i = 1
    while i <= 10
      @letter = ("A".."Z").to_a.sample
      @letters << @letter
      i += 1
    end
    @letters
  end


  def english_word?(question)
    url = "https://wagon-dictionary.herokuapp.com/#{question}"
    serialized_result = open(url).read
    final_serialized_result = JSON.parse(serialized_result)
    return final_serialized_result["found"]
  end

  def correct_letters?(guess, grid)
    guess.split("").all? {|letter| guess.count(letter) <= grid.count(letter) }
  end
end

