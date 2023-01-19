require 'set'
require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    array = []
    while array.length < 10
     array << ('a'..'z').to_a[rand(26)]
     array.uniq!
    end
    @letters = array
  end

  def score
    @word = params[:question]
    @new_letters = params[:letters].chars
    @input = params[:question].chars
    @result = (@input.to_set).subset?(@new_letters.to_set)
    if @result
      @result = "You got the word"
      url = "https://wagon-dictionary.herokuapp.com/#{@word}"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      @answer = user["found"]
    else
      @result = "You didin't get the word"
    end
  end
end
