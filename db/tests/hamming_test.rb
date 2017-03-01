#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'code'

class HammingTest < Minitest::Test

  def test_long_identical_strands
    assert_equal 0, Hamming.compute('GGACTGA', 'GGACTGA')
  end

  def test_small_distance
    assert_equal 1, Hamming.compute('GGACG', 'GGTCG')
  end

  def test_large_distance
    assert_equal 4, Hamming.compute('GATACA', 'GCATAA')
  end

  def test_large_distance_in_off_by_one_strand
    assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
  end

  def test_empty_strands
    assert_equal 0, Hamming.compute('', '')
  end

end
