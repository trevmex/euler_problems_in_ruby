require 'test/unit'
require File.join(File.dirname(__FILE__), "..", __FILE__.split("tc_").last)
include Euler

class TestProblemN < Test::Unit::TestCase
  def test_1_is_1
    assert_equal(1, 1);
  end
end
