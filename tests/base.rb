module Tests
  class Base
    def self.solutions
      @solutions ||= []
    end

    def self.test_cases
      @test_cases ||= []
    end

    def self.solution(name, lambda)
      solutions << { name: name, lambda: lambda }
    end

    def self.test_case(args, expected)
      test_cases << { args: args, expected: expected }
    end
  end
end
