require 'test/unit'
require File.join(File.dirname(__FILE__), "..", __FILE__.split("tc_").last)
include Euler

class TestProblem4 < Test::Unit::TestCase
  def test_2_digits_in_base_10_equal_9009
    assert_equal(Problem4.new(2, 10).solution, "9009")
  end

  def test_3_digits_in_base_10_equal_906609
    assert_equal(Problem4.new(3, 10).solution, "906609")
  end

  def test_4_digits_in_base_10_equal_99000099
    assert_equal(Problem4.new(4, 10).solution, "99000099")
  end

  def test_4_digits_in_base_2_equal_11000011
    assert_equal(Problem4.new(4, 2).solution, "11000011")
  end

  def test_4_digits_in_base_7_equal_66300366
    assert_equal(Problem4.new(4, 7).solution, "66300366")
  end

  def test_2_digits_in_base_16_equal_f00f
    assert_equal(Problem4.new(2, 16).solution, "f00f")
  end
end
