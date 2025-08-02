require_relative "../shared_test_cases"

alias shared_test_cases test_cases

def test_cases
  shared_test_cases.map do |tc|
    tc[:solution] = to_list(tc[:solution])
    tc
  end
end
