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
    raise
  end
end
