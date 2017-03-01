require 'minitest/autorun'
require_relative 'code'

# Test data version: aa12f2e
class GrainsTest < Minitest::Test

  def test_16
    assert_equal 32_768, Grains.square(16)
  end

  def test_32
    assert_equal 2_147_483_648, Grains.square(32)
  end

  def test_64
    assert_equal 9_223_372_036_854_775_808, Grains.square(64)
  end

  def test_returns_the_total_number_of_grains_on_the_board
    assert_equal 18_446_744_073_709_551_615, Grains.total
  end
end
