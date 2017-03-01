#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'code'

class RaindropsTest < Minitest::Test

  def test_3
    assert_equal 'Pling', Raindrops.convert(3)
  end

  def test_5
    assert_equal 'Plang', Raindrops.convert(5)
  end

  def test_7
    assert_equal 'Plong', Raindrops.convert(7)
  end

  def test_6
    assert_equal 'Pling', Raindrops.convert(6)
  end

  def test_8
    assert_equal '8', Raindrops.convert(8)
  end

  def test_105
    assert_equal 'PlingPlangPlong', Raindrops.convert(105)
  end
end
