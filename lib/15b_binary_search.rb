# frozen_string_literal: true

# class for computer to find the answer using a binary search
class BinarySearch
  attr_accessor :min, :max
  attr_reader :answer, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max), guess = nil)
    @min = min
    @max = max
    @answer = answer.value
    @guess = guess
  end

  def make_guess
    @guess = (min + max) / 2
  end

  def game_over?
    guess == answer
  end

  def update_range
    guess < answer ? self.min = guess + 1 : self.max = guess - 1
  end
end
