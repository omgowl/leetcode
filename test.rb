require "minitest/autorun"
require_relative "#{ARGV[0]}/solution"
require_relative "#{ARGV[0]}/test_cases"

class TestMain < Minitest::Test
  def test_main
    test_cases.each.with_index do |tc, idx|
      assert_equal tc[:solution], send(test_method_name, *tc[:args]), "Failed case: #{idx}"
    end
  end
end
