#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'code'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class DifferenceOfSquaresTest < Minitest::Test

  def test_square_of_sum_10
    assert_equal 3_025, Squares.new(10).square_of_sum
  end

  def test_sum_of_squares_5
    assert_equal 55, Squares.new(5).sum_of_squares
  end

  def test_sum_of_squares_100
    assert_equal 338_350, Squares.new(100).sum_of_squares
  end

  def test_difference_of_squares_0
    assert_equal 0, Squares.new(0).difference
  end

  def test_difference_of_squares_100
    assert_equal 25_164_150, Squares.new(100).difference
  end

end
