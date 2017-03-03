#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'code'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class RomanNumeralsTest < Minitest::Test

  def test_27
    assert_equal 'XXVII', 27.to_roman
  end

  def test_93
    assert_equal 'XCIII', 93.to_roman
  end

  def test_402
    assert_equal 'CDII', 402.to_roman
  end

  def test_911
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1024
    assert_equal 'MXXIV', 1024.to_roman
  end

end
