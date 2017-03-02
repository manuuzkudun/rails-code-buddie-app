#!/usr/bin/env ruby
# encoding: utf-8
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'code'

# Test data version: # f04fb3d
class PangramTest < Minitest::Test
  def test_sentence_empty
    phrase = ''
    result = Pangram.pangram?(phrase)
    refute result, "Expected: false \nActual: #{result.inspect}"
  end

  def test_pangram_with_only_lower_case
    phrase = 'the quick brown fox jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected: true \nActual: #{result.inspect}"
  end

  def test_missing_character_x
    phrase = 'a quick movement of the enemy will jeopardize five gunboats'
    result = Pangram.pangram?(phrase)
    refute result, "Expected: false \nActual: #{result.inspect}"
  end

  def test_pangram_with_underscores
    phrase = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected: true \nActual: #{result.inspect}"
  end

  def test_pangram_with_numbers
    phrase = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    result = Pangram.pangram?(phrase)
    assert result, "Expected: true \nActual: #{result.inspect}"
  end

  def test_pangram_with_mixed_case_and_punctuation
    skip
    phrase = '"Five quacking Zephyrs jolt my wax bed."'
    result = Pangram.pangram?(phrase)
    assert result, "Expected: true \nActual: #{result.inspect}"
  end
end
