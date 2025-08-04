require "minitest/autorun"
require_relative "../#{ARGV[0]}/tests/acceptance"

class TestAcceptance < Minitest::Test
  def test_acceptance
    Acceptance.solutions.each do |solution|
      Acceptance.test_cases.each.with_index do |test_case, idx|
        assert_equal test_case[:expected], solution[:lambda].call(test_case[:args]),
                     "Failed `#{solution[:name]}` case: #{idx + 1}"
      end
    end
  end
end
