require "minitest/autorun"
require_relative "../#{ARGV[0]}/tests/acceptance"

class TestAcceptance < Minitest::Test
  def test_acceptance
    Acceptance.solutions.each do |solution|
      if ARGV[1]
        idx = ARGV[1].to_i - 1
        run_test_case(solution, Acceptance.test_cases[idx], idx)
      else
        Acceptance.test_cases.each.with_index do |test_case, idx|
          run_test_case(solution, test_case, idx)
        end
      end
    end
  end

  private

  def run_test_case(solution, test_case, idx)
    assert_equal test_case[:expected], solution[:lambda].call(test_case[:args]),
                 "Failed `#{solution[:name]}` case: #{idx + 1}"
  end
end
