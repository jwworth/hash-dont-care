require 'minitest/autorun'
require './hash_dont_care.rb'

class TestHashDontCare < Minitest::Test
  def test_sets_key_to_symbol
    rgb = HashDontCare.new
    rgb['black'] = '#000000'
    assert_equal '#000000', rgb[:black]
  end

  def test_it_retrieves_indifferently
    rgb = HashDontCare.new
    rgb[:black] = '#000000'
    assert_equal '#000000', rgb[:black]
    assert_equal '#000000', rgb['black']
  end

  def test_it_retrieves_multiple_keys_indifferently
    rgb = HashDontCare.new
    rgb['black'] = '#000000'
    rgb['white'] = '#ffffff'
    assert_equal [:black, :white], rgb.keys
  end

  def test_it_has_railsy_aliases
    rgb = HashDontCare.new
    rgb.store('black', '#000000')
    assert_equal '#000000', rgb[:black]
  end

  def test_sets_default_value
    rgb = HashDontCare.new('#000000')
    assert_equal '#000000', rgb[:black]
  end
end
